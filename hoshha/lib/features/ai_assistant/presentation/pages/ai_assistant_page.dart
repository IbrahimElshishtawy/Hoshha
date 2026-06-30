import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AiAssistantPage extends StatefulWidget {
  const AiAssistantPage({super.key});

  @override
  State<AiAssistantPage> createState() => _AiAssistantPageState();
}

class _AiAssistantPageState extends State<AiAssistantPage> {
  final _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'isUser': false,
      'text': 'أهلاً إبراهيم، كيف يمكنني مساعدتك في إدارة أموالك اليوم؟',
      'time': '09:41 AM',
    },
    {
      'isUser': true,
      'text': 'أريد معرفة مصاريفي في المطاعم لهذا الشهر.',
      'time': '09:42 AM',
    },
    {
      'isUser': false,
      'text': 'لقد أنفقت 1,240 ريال على المطاعم هذا الشهر. هذا يمثل 15% من ميزانيتك.',
      'time': '09:42 AM',
      'showChart': true,
    }
  ];

  bool _isListening = false;

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'isUser': true,
        'text': text,
        'time': 'الان',
      });
      _messageController.clear();
    });

    // Simulate AI response
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _messages.add({
          'isUser': false,
          'text': 'شكراً لطرحك هذا السؤال! سأقوم بتحليل بياناتك المالية وإفادتك بالتفاصيل قريباً.',
          'time': 'الان',
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withValues(alpha: 0.7),
        elevation: 2.0,
        shadowColor: Colors.black12,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: AppTheme.onSurfaceVariant),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        leading: const SizedBox.shrink(), // Suppress default leading to match design direction
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hawsha AI',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  _isListening ? 'Hawsha AI is listening...' : 'جاهز للمساعدة',
                  style: TextStyle(
                    color: _isListening ? AppTheme.secondary : AppTheme.outline,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12.0),
            // Orb logo
            Container(
              width: 38.0,
              height: 38.0,
              decoration: const BoxDecoration(
                color: AppTheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background glows
          Positioned(
            top: 40,
            left: 40,
            width: 200,
            height: 200,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primary.withValues(alpha: 0.02),
                ),
              ),
            ),
          ),

          Column(
            children: [
              // Chat Messages Area
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.containerMargin,
                    vertical: 20.0,
                  ),
                  itemCount: _messages.length + 1, // +1 for Date Indicator
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // Date Indicator
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'اليوم',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppTheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      );
                    }

                    final message = _messages[index - 1];
                    final isUser = message['isUser'] as bool;
                    final showChart = message['showChart'] == true;

                    return _buildChatBubble(
                      text: message['text'] as String,
                      time: message['time'] as String,
                      isUser: isUser,
                      showChart: showChart,
                      context: context,
                    );
                  },
                ),
              ),

              // Interactive Input Zone
              Container(
                padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.7),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(32.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20.0,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Suggested Questions
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true, // RTL match
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          _buildSuggestionChip('كيف يمكنني توفير المزيد؟'),
                          _buildSuggestionChip('أين أنفق معظم أموالي؟'),
                          _buildSuggestionChip('هل يمكنني شراء لابتوب هذا الشهر؟'),
                          _buildSuggestionChip('نصيحة مالية لليوم'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),

                    // Input Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
                      child: Row(
                        children: [
                          // Voice button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isListening = !_isListening;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 56.0,
                              height: 56.0,
                              decoration: BoxDecoration(
                                color: _isListening ? AppTheme.tertiary : AppTheme.primary,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: (_isListening ? AppTheme.tertiary : AppTheme.primary).withValues(alpha: 0.25),
                                    blurRadius: 15.0,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Icon(
                                _isListening ? Icons.graphic_eq : Icons.mic,
                                color: Colors.white,
                                size: 28.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),

                          // Text input box
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceContainerLow,
                                border: Border.all(color: AppTheme.outlineVariant.withValues(alpha: 0.3)),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.send, color: AppTheme.primary),
                                    onPressed: _sendMessage,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _messageController,
                                      textAlign: TextAlign.right,
                                      onSubmitted: (_) => _sendMessage(),
                                      decoration: const InputDecoration(
                                        hintText: 'اسأل Hawsha أي شيء...',
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        filled: false,
                                        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble({
    required String text,
    required String time,
    required bool isUser,
    required bool showChart,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);

    return Align(
      alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUser) ...[
              Container(
                width: 32.0,
                height: 32.0,
                margin: const EdgeInsets.only(top: 4.0),
                decoration: const BoxDecoration(
                  color: AppTheme.primaryContainer,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
              const SizedBox(width: 8.0),
            ],
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: isUser ? AppTheme.primary : Colors.white.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    bottomLeft: Radius.circular(isUser ? 20.0 : 4.0),
                    bottomRight: Radius.circular(isUser ? 4.0 : 20.0),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      text,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: isUser ? Colors.white : AppTheme.onSurface,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    if (showChart) ...[
                      const SizedBox(height: 12.0),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '80% مستهلك',
                                  style: TextStyle(
                                    color: AppTheme.primary,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'ميزانية المطاعم',
                                  style: TextStyle(
                                    color: AppTheme.onSurfaceVariant,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                              child: const LinearProgressIndicator(
                                value: 0.8,
                                minHeight: 8.0,
                                backgroundColor: AppTheme.outlineVariant,
                                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 6.0),
                    Text(
                      time,
                      style: TextStyle(
                        color: isUser ? AppTheme.primaryFixedDim : AppTheme.outline,
                        fontSize: 9.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionChip(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _messageController.text = text;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppTheme.onSurfaceVariant,
            fontSize: 11.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
