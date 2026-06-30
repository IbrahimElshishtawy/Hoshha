import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ChatInputRow extends StatefulWidget {
  final Function(String) onSend;
  final bool isListening;
  final VoidCallback onMicToggle;

  const ChatInputRow({
    super.key,
    required this.onSend,
    required this.isListening,
    required this.onMicToggle,
  });

  @override
  State<ChatInputRow> createState() => _ChatInputRowState();
}

class _ChatInputRowState extends State<ChatInputRow> {
  final _controller = TextEditingController();

  void _submit() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onSend(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
      child: Row(
        children: [
          // Voice mic visualizer button
          GestureDetector(
            onTap: widget.onMicToggle,
            child: Container(
              width: 56.0,
              height: 56.0,
              decoration: BoxDecoration(
                color: widget.isListening ? AppTheme.tertiary : AppTheme.primary,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: (widget.isListening ? AppTheme.tertiary : AppTheme.primary).withValues(alpha: 0.25),
                    blurRadius: 15.0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                widget.isListening ? Icons.graphic_eq : Icons.mic,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ),
          const SizedBox(width: 12.0),

          // Text field container
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
                    onPressed: _submit,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 14.0),
                      decoration: const InputDecoration(
                        hintText: 'اسأل هوشة عن ميزانيتك...',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: false,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                      onSubmitted: (_) => _submit(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
