import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'عرض الكل',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
              ),
            ),
            Text(
              'آخر المعاملات',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppTheme.onSurface,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),

        // List
        _buildTransactionItem(
          title: 'أمازون',
          date: 'اليوم، 2:30 م',
          amount: '-250.00 ريال',
          isIncome: false,
          icon: Icons.shopping_bag,
          iconBgColor: AppTheme.surfaceContainer,
          iconColor: AppTheme.primary,
          context: context,
        ),
        const SizedBox(height: 12.0),
        _buildTransactionItem(
          title: 'الراتب الشهري',
          date: '25 أكتوبر',
          amount: '+15,000 ريال',
          isIncome: true,
          icon: Icons.payments,
          iconBgColor: AppTheme.secondaryContainer.withOpacity(0.2),
          iconColor: AppTheme.secondary,
          context: context,
        ),
        const SizedBox(height: 12.0),
        _buildTransactionItem(
          title: 'إيجار السكن',
          date: '24 أكتوبر',
          amount: '-3,000 ريال',
          isIncome: false,
          icon: Icons.home_work,
          iconBgColor: AppTheme.surfaceContainer,
          iconColor: AppTheme.primary,
          context: context,
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String date,
    required String amount,
    required bool isIncome,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
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
          // Amount on the left (end)
          Text(
            amount,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: isIncome ? AppTheme.secondary : AppTheme.error,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Info & Icon on the right (start)
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppTheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    date,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
