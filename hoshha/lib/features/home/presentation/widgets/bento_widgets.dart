import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class BentoWidgets extends StatelessWidget {
  const BentoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Health Score Card
        _buildHealthScoreCard(context),
        const SizedBox(height: 16.0),
        // Savings Goal Card
        _buildSavingsGoalCard(context),
      ],
    );
  }

  Widget _buildHealthScoreCard(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Radial progress on the left (RTL swap makes it right/left)
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80.0,
                height: 80.0,
                child: CircularProgressIndicator(
                  value: 0.85,
                  strokeWidth: 8.0,
                  backgroundColor: AppTheme.surfaceVariant,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primary),
                ),
              ),
              Text(
                '85',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Info on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'صحتك المالية',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppTheme.onSurface,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'ممتاز',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'أنت أفضل من 85% من المستخدمين',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppTheme.secondary,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavingsGoalCard(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'سيارة جديدة',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              Text(
                'هدف الادخار',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppTheme.onSurface,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '75,000 ريال',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '120,000 ريال',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
            child: const LinearProgressIndicator(
              value: 0.62,
              minHeight: 12.0,
              backgroundColor: AppTheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'تم إنجاز 62% من الهدف',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppTheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
