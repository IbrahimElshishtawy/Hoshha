import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../pages/budget_management_page.dart';

class BudgetLimitCard extends StatelessWidget {
  final BudgetLimitData budget;

  const BudgetLimitCard({
    super.key,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = budget.spent / budget.limit;
    final isExceeded = budget.spent > budget.limit;
    final isWarning = ratio >= 0.8 && !isExceeded;

    Color progressColor = AppTheme.primary;
    Color glowColor = Colors.transparent;

    if (isExceeded) {
      progressColor = AppTheme.error;
      glowColor = AppTheme.error.withValues(alpha: 0.1);
    } else if (isWarning) {
      progressColor = Colors.orange;
      glowColor = Colors.orange.withValues(alpha: 0.1);
    }

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        boxShadow: [
          BoxShadow(
            color: isExceeded || isWarning ? glowColor.withValues(alpha: 0.2) : Colors.black12,
            blurRadius: 10.0,
            offset: const Offset(0, 2),
          ),
        ],
        border: isExceeded || isWarning
            ? Border.all(color: progressColor.withValues(alpha: 0.3), width: 1.0)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المتبقي: ${(budget.limit - budget.spent).toStringAsFixed(0)} ريال',
                style: TextStyle(
                  color: isExceeded ? AppTheme.error : AppTheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              Row(
                children: [
                  Text(
                    budget.categoryName,
                    style: const TextStyle(
                      color: AppTheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Icon(budget.icon, color: progressColor),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${budget.spent.toStringAsFixed(0)} ريال مصاريف',
                style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
              ),
              Text(
                'الحد الأقصى: ${budget.limit.toStringAsFixed(0)} ريال',
                style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
            child: LinearProgressIndicator(
              value: ratio > 1.0 ? 1.0 : ratio,
              minHeight: 10.0,
              backgroundColor: AppTheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
        ],
      ),
    );
  }
}
