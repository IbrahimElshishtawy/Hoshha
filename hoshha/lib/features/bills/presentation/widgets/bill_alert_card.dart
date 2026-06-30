import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class BillAlertCard extends StatelessWidget {
  const BillAlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppTheme.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        border: Border.all(color: AppTheme.error.withValues(alpha: 0.2)),
      ),
      child: const Row(
        children: [
          Icon(Icons.notifications_active, color: AppTheme.error, size: 28.0),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'فواتير متأخرة الدفع',
                  style: TextStyle(
                    color: AppTheme.error,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'لديك فاتورة إنترنت منزلية متأخرة الدفع منذ 3 أيام بمبلغ 230 ريال. يرجى سدادها لتجنب انقطاع الخدمة.',
                  style: TextStyle(
                    color: AppTheme.onSurface,
                    fontSize: 11.0,
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
}
