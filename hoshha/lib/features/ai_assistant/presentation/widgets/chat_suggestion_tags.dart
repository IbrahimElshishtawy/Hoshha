import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ChatSuggestionTags extends StatelessWidget {
  final Function(String) onTap;

  const ChatSuggestionTags({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      'نصيحة مالية لليوم',
      'كم أنفقت هذا الأسبوع؟',
      'تحليل ميزانية التسوق',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true, // Matches RTL layout
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
        child: Row(
          children: suggestions.map((tag) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () => onTap(tag),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: AppTheme.outlineVariant.withValues(alpha: 0.5)),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
