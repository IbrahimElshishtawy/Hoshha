import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class DebtSummaryCard extends StatelessWidget {
  final String activeTab;

  const DebtSummaryCard({
    super.key,
    required this.activeTab,
  });

  @override
  Widget build(BuildContext context) {
    final isOwe = activeTab == 'owe';

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: isOwe ? AppTheme.error.withValues(alpha: 0.08) : AppTheme.secondary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(
          color: isOwe ? AppTheme.error.withValues(alpha: 0.2) : AppTheme.secondary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isOwe ? 'إجمالي الديون الالتزامية' : 'إجمالي مستحقاتك الخارجية',
            style: const TextStyle(fontSize: 12.0, color: AppTheme.onSurfaceVariant),
          ),
          Text(
            isOwe ? '3,850 ريال' : '1,650 ريال',
            style: TextStyle(
              color: isOwe ? AppTheme.error : AppTheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
