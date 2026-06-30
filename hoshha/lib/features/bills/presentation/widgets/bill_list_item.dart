import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/bill.dart';

class BillListItem extends StatelessWidget {
  final Bill bill;

  const BillListItem({
    super.key,
    required this.bill,
  });

  @override
  Widget build(BuildContext context) {
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
        border: bill.isOverdue
            ? Border.all(color: AppTheme.error.withValues(alpha: 0.3), width: 1.0)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Pay Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: bill.isOverdue ? AppTheme.error : AppTheme.primary,
              minimumSize: const Size(80, 36),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
            child: const Text(
              'ادفع الآن',
              style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
          ),
          // Details
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    bill.title,
                    style: const TextStyle(
                      color: AppTheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    bill.dueDate,
                    style: TextStyle(
                      color: bill.isOverdue ? AppTheme.error : AppTheme.onSurfaceVariant,
                      fontSize: 11.0,
                      fontWeight: bill.isOverdue ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${bill.amount.toStringAsFixed(0)} ريال',
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: (bill.isOverdue ? AppTheme.error : AppTheme.primary).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  bill.icon,
                  color: bill.isOverdue ? AppTheme.error : AppTheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
