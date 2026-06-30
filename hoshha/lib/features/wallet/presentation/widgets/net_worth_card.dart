import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class NetWorthCard extends StatelessWidget {
  const NetWorthCard({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'صافي الثروة التقديري',
            style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 12.0),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: 8.0),
          Text(
            '45,230 ريال',
            style: TextStyle(
              color: AppTheme.primary,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: 16.0),
          Divider(),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الالتزامات والديون',
                    style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 11.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '3,850 ريال',
                    style: TextStyle(
                      color: AppTheme.error,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'إجمالي الأصول والمدخرات',
                    style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 11.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '49,080 ريال',
                    style: TextStyle(
                      color: AppTheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
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
