import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../pages/debt_tracker_page.dart';

class DebtListItem extends StatelessWidget {
  final DebtItemData debt;
  final String activeTab;

  const DebtListItem({
    super.key,
    required this.debt,
    required this.activeTab,
  });

  @override
  Widget build(BuildContext context) {
    final isOwe = activeTab == 'owe';

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
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
          // Settle button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: isOwe ? AppTheme.error : AppTheme.secondary,
              minimumSize: const Size(80, 36),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
            child: Text(
              isOwe ? 'سداد' : 'تحصيل',
              style: const TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
          ),
          // Details on the right
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                debt.personName,
                style: const TextStyle(
                  color: AppTheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                debt.description,
                style: const TextStyle(
                  color: AppTheme.onSurfaceVariant,
                  fontSize: 11.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${debt.amount.toStringAsFixed(0)} ريال',
                    style: TextStyle(
                      color: isOwe ? AppTheme.error : AppTheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    'تاريخ الاستحقاق: ${debt.dueDate}',
                    style: const TextStyle(
                      color: AppTheme.outline,
                      fontSize: 10.0,
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
