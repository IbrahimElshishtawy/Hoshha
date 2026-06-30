import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SummaryStatsRow extends StatelessWidget {
  const SummaryStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true, // Scroll direction RTL matches RTL layout
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            _buildStatCard(
              title: 'الادخار',
              value: '10,800',
              color: AppTheme.primary,
              context: context,
            ),
            const SizedBox(width: 16.0),
            _buildStatCard(
              title: 'المصاريف',
              value: '4,200',
              color: AppTheme.error,
              context: context,
            ),
            const SizedBox(width: 16.0),
            _buildStatCard(
              title: 'الدخل',
              value: '15,000',
              color: AppTheme.secondary,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);

    return Container(
      width: 144.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border(
          right: BorderSide(color: color, width: 4.0),
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
            title,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppTheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'ريال',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4.0),
              Text(
                value,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
