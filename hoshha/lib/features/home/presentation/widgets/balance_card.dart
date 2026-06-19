import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'package:hoshha/theme/theme_extensions.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    required this.currentBalance,
    required this.todayExpenses,
    required this.monthExpenses,
    super.key,
  });

  final double currentBalance;
  final double todayExpenses;
  final double monthExpenses;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    final numberFormat = NumberFormat('#,##0.##', Localizations.localeOf(context).languageCode);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(radius.lg),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.25),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.homeCurrentBalance,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                numberFormat.format(currentBalance),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                l10n.homeCurrency,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.lg),
          Row(
            children: [
              Expanded(
                child: _buildExpenseSubCard(
                  context: context,
                  label: l10n.homeExpensesToday,
                  amount: todayExpenses,
                  numberFormat: numberFormat,
                  currencyAbbr: l10n.homeCurrencyAbbr,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildExpenseSubCard(
                  context: context,
                  label: l10n.homeExpensesMonth,
                  amount: monthExpenses,
                  numberFormat: numberFormat,
                  currencyAbbr: l10n.homeCurrencyAbbr,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseSubCard({
    required BuildContext context,
    required String label,
    required double amount,
    required NumberFormat numberFormat,
    required String currencyAbbr,
  }) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.md,
        vertical: spacing.md,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(radius.md),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                numberFormat.format(amount),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                currencyAbbr,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
