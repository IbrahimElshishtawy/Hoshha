import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/chat_message.dart';

class ChatBubbleStream extends StatelessWidget {
  final List<ChatMessage> messages;

  const ChatBubbleStream({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.containerMargin),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildBubble(context, msg),
        );
      },
    );
  }

  Widget _buildBubble(BuildContext context, ChatMessage msg) {
    final isUser = msg.isUser;

    return Row(
      mainAxisAlignment: isUser ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isUser) ...[
          Flexible(
            child: _buildBubbleContent(context, msg, isUser),
          ),
          const SizedBox(width: 8.0),
          _buildAvatar(Icons.person, AppTheme.outline),
        ] else ...[
          _buildAvatar(Icons.auto_awesome, AppTheme.primary),
          const SizedBox(width: 8.0),
          Flexible(
            child: _buildBubbleContent(context, msg, isUser),
          ),
        ],
      ],
    );
  }

  Widget _buildAvatar(IconData icon, Color color) {
    return Container(
      width: 36.0,
      height: 36.0,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color,
        size: 18.0,
      ),
    );
  }

  Widget _buildBubbleContent(BuildContext context, ChatMessage msg, bool isUser) {


    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            msg.content,
            style: TextStyle(
              color: isUser ? Colors.white : AppTheme.onSurface,
              fontSize: 14.0,
              height: 1.5,
            ),
            textAlign: TextAlign.end,
          ),
          if (msg.customData != null && msg.customData!['type'] == 'budget_progress') ...[
            const SizedBox(height: 12.0),
            _buildMiniProgress(
              context,
              spent: msg.customData!['spent'] as double,
              limit: msg.customData!['limit'] as double,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMiniProgress(BuildContext context, {required double spent, required double limit}) {
    final ratio = spent / limit;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${(ratio * 100).toStringAsFixed(0)}%',
              style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: AppTheme.primary),
            ),
            const Text(
              'ميزانية الطعام المستهلكة',
              style: TextStyle(fontSize: 10.0, color: AppTheme.onSurfaceVariant),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: LinearProgressIndicator(
            value: ratio,
            minHeight: 6.0,
            backgroundColor: AppTheme.surfaceVariant,
            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primary),
          ),
        ),
      ],
    );
  }
}
