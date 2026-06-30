import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AiInsightCard extends StatelessWidget {
  const AiInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppTheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryContainer.withOpacity(0.3),
            blurRadius: 15.0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background soft glow
          Positioned(
            bottom: -40,
            left: -40,
            width: 96,
            height: 96,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info text on the left/right
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'نصيحة هوشة الذكية',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      'يمكنك توفير 500 ريال إضافية هذا الشهر من خلال تقليل مصاريف المقاهي. هل تود تحديد ميزانية مخصصة؟',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppTheme.onPrimaryContainer,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              // AI brain orb icon
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: const Icon(
                  Icons.psychology,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
