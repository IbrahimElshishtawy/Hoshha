import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'package:hoshha/theme/theme_extensions.dart';
import '../../domain/entities/home_transaction.dart';

class RecentTransactionsList extends StatelessWidget {
  const RecentTransactionsList({
    required this.transactions,
    required this.onViewAllPressed,
    super.key,
  });

  final List<HomeTransaction> transactions;
  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.appColors;
    final radius = context.appRadius;

    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.homeRecentExpensesSectionTitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: onViewAllPressed,
              child: Text(
                l10n.homeViewAll,
                style: TextStyle(
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius.lg),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.015),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: colors.outline.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => Divider(
              color: colors.outline.withValues(alpha: 0.08),
              height: 1,
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return _buildTransactionTile(context, transaction, isRtl);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionTile(
    BuildContext context,
    HomeTransaction transaction,
    bool isRtl,
  ) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context);

    final title = isRtl ? transaction.titleAr : transaction.titleEn;
    final dateString = _formatTransactionDate(context, transaction.date, isRtl);

    final numberFormat = NumberFormat('#,##0.##', Localizations.localeOf(context).languageCode);
    final amountString = '${transaction.isIncome ? '+' : '-'}${numberFormat.format(transaction.amount)} ${l10n.homeCurrencyAbbr}';

    // Style properties according to category
    final style = _getCategoryStyle(transaction.category);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: style.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              style.icon,
              color: style.iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateString,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amountString,
            style: TextStyle(
              color: transaction.isIncome ? colors.success : colors.error,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTransactionDate(BuildContext context, DateTime dateTime, bool isRtl) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(dateTime.year, dateTime.month, dateTime.day);

    final timeFormatter = DateFormat('jm', isRtl ? 'ar' : 'en');
    final timeString = timeFormatter.format(dateTime);

    if (dateToCheck == today) {
      return isRtl ? 'اليوم، $timeString' : 'Today, $timeString';
    } else if (dateToCheck == yesterday) {
      return isRtl ? 'أمس، $timeString' : 'Yesterday, $timeString';
    } else {
      final dateFormatter = DateFormat('d MMMM', isRtl ? 'ar' : 'en');
      return '${dateFormatter.format(dateTime)}، $timeString';
    }
  }

  _CategoryStyle _getCategoryStyle(String category) {
    switch (category) {
      case 'food':
        return _CategoryStyle(
          icon: Icons.restaurant,
          iconColor: Colors.red.shade700,
          bgColor: Colors.red.shade50,
        );
      case 'salary':
        return _CategoryStyle(
          icon: Icons.work_outline,
          iconColor: Colors.green.shade700,
          bgColor: Colors.green.shade50,
        );
      case 'utilities':
        return _CategoryStyle(
          icon: Icons.router_outlined,
          iconColor: Colors.blue.shade700,
          bgColor: Colors.blue.shade50,
        );
      case 'transport':
        return _CategoryStyle(
          icon: Icons.directions_car_outlined,
          iconColor: Colors.orange.shade700,
          bgColor: Colors.orange.shade50,
        );
      default:
        return _CategoryStyle(
          icon: Icons.receipt_long_outlined,
          iconColor: Colors.grey.shade700,
          bgColor: Colors.grey.shade50,
        );
    }
  }
}

class _CategoryStyle {
  const _CategoryStyle({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });

  final IconData icon;
  final Color iconColor;
  final Color bgColor;
}
