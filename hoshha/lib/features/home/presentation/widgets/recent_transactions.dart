import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../transaction/domain/entities/transaction_entity.dart';

class RecentTransactions extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const RecentTransactions({
    super.key,
    required this.transactions,
  });

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

        if (transactions.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'لا توجد معاملات بعد',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
            ),
          )
        else
          ...transactions.map((tx) {
            final isIncome = tx.type == 'income';
            final amountText = '${isIncome ? "+" : "-"}${tx.amount.toStringAsFixed(0)} ريال';

            IconData categoryIcon = Icons.receipt_long;
            Color iconColor = AppTheme.primary;
            Color iconBgColor = AppTheme.surfaceContainer;

            if (tx.category == 'shopping_bag') {
              categoryIcon = Icons.shopping_bag;
              iconColor = AppTheme.primary;
              iconBgColor = AppTheme.surfaceContainer;
            } else if (tx.category == 'payments') {
              categoryIcon = Icons.payments;
              iconColor = AppTheme.secondary;
              iconBgColor = AppTheme.secondaryContainer.withValues(alpha: 0.2);
            } else if (tx.category == 'home_work') {
              categoryIcon = Icons.home_work;
              iconColor = AppTheme.primary;
              iconBgColor = AppTheme.surfaceContainer;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _buildTransactionItem(
                title: tx.title,
                date: tx.date,
                amount: amountText,
                isIncome: isIncome,
                icon: categoryIcon,
                iconBgColor: iconBgColor,
                iconColor: iconColor,
                context: context,
              ),
            );
          }),
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
