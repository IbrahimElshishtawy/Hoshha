import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AnalyticsRadialChart extends StatelessWidget {
  const AnalyticsRadialChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'توزيع المصاريف حسب التصنيف',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppTheme.onSurface,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24.0),
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: 140,
                height: 140,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 16.0,
                  backgroundColor: AppTheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                ),
              ),
              const SizedBox(
                width: 108,
                height: 108,
                child: CircularProgressIndicator(
                  value: 0.58,
                  strokeWidth: 12.0,
                  backgroundColor: AppTheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.secondary),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'المجموع',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                    ),
                  ),
                  const Text(
                    '3,000 ريال',
                    style: TextStyle(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
