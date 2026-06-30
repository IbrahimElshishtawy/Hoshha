import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class NetWorthCard extends StatelessWidget {
  final double netWorth;
  final double assets;
  final double liabilities;

  const NetWorthCard({
    super.key,
    required this.netWorth,
    required this.assets,
    required this.liabilities,
  });

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'صافي الثروة التقديري',
            style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 12.0),
            textAlign: TextAlign.end,
          ),
          const SizedBox(height: 8.0),
          Text(
            '${netWorth.toStringAsFixed(0)} ريال',
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الالتزامات والديون',
                    style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 11.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${liabilities.toStringAsFixed(0)} ريال',
                    style: const TextStyle(
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
                  const Text(
                    'إجمالي الأصول والمدخرات',
                    style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 11.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${assets.toStringAsFixed(0)} ريال',
                    style: const TextStyle(
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
