import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final double trend;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background soft glow circle
          Positioned(
            top: -50,
            right: -50,
            width: 130,
            height: 130,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primary.withValues(alpha: 0.08),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.1),
                    blurRadius: 30.0,
                    spreadRadius: 10.0,
                  ),
                ],
              ),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'إجمالي الرصيد الحالي',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'ريال',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    balance.toStringAsFixed(2),
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${trend >= 0 ? "+" : ""}${trend.toStringAsFixed(1)}% منذ الشهر الماضي',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppTheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  const Icon(
                    Icons.trending_up,
                    color: AppTheme.secondary,
                    size: 16.0,
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
