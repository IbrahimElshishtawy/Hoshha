import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';

import '../../../expenses/domain/expense.dart';
import '../../../expenses/expenses_providers.dart';
import '../../../../theme/theme_extensions.dart';
import 'expense_preview_tile.dart';
import 'home_empty_state_banner.dart';
import 'home_section_error.dart';
import 'home_section_skeleton.dart';

class HomeRecentExpensesSection extends ConsumerWidget {
  const HomeRecentExpensesSection({
    super.key,
    required this.onAddExpensePressed,
    required this.onSeeAllPressed,
  });

  final VoidCallback onAddExpensePressed;
  final VoidCallback onSeeAllPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final expensesAsync = ref.watch(recentExpensesProvider);

    return expensesAsync.when(
      loading: () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: l10n.homeRecentExpensesSectionTitle),
          const SizedBox(height: 12),
          const HomeSectionSkeleton.list(),
        ],
      ),
      error: (error, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: l10n.homeRecentExpensesSectionTitle),
          SizedBox(height: context.appSpacing.md),
          HomeSectionError(
            title: l10n.homeRecentExpensesSectionTitle,
            message: l10n.homeSectionLoadFailure(
              l10n.homeRecentExpensesSectionTitle,
            ),
            retryLabel: l10n.homeRetry,
            onRetry: () => ref.invalidate(recentExpensesProvider),
          ),
        ],
      ),
      data: (expenses) {
        final visibleExpenses = expenses.take(5).toList(growable: false);
        final showSeeAll = visibleExpenses.length == 5;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(
              title: l10n.homeRecentExpensesSectionTitle,
              actionLabel: showSeeAll ? l10n.homeViewAll : null,
              onActionPressed: showSeeAll ? onSeeAllPressed : null,
            ),
            SizedBox(height: context.appSpacing.md),
            if (visibleExpenses.isEmpty)
              Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.all(context.appSpacing.lg),
                  child: HomeEmptyStateBanner(
                    icon: Icons.receipt_long_outlined,
                    title: l10n.homeRecentExpensesEmptyTitle,
                    message: l10n.homeRecentExpensesEmptyMessage,
                    actionLabel: l10n.homePrimaryActionAddExpense,
                    onActionPressed: onAddExpensePressed,
                  ),
                ),
              )
            else
              Card(
                child: Column(
                  children: [
                    for (
                      var index = 0;
                      index < visibleExpenses.length;
                      index++
                    ) ...[
                      ExpensePreviewTile(
                        amountText: _formatMoney(
                          context,
                          visibleExpenses[index].amountMinor,
                        ),
                        categoryText: _categoryText(
                          l10n,
                          visibleExpenses[index],
                        ),
                        dateText: _formatDate(
                          context,
                          visibleExpenses[index].occurredAt,
                        ),
                        noteText: _noteText(visibleExpenses[index]),
                      ),
                      if (index != visibleExpenses.length - 1)
                        Divider(
                          height: 1,
                          indent: context.appSpacing.md,
                          endIndent: context.appSpacing.md,
                        ),
                    ],
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  String _formatMoney(BuildContext context, int minorUnits) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: locale.startsWith('ar') ? 'ج.م' : 'EGP',
      decimalDigits: minorUnits % 100 == 0 ? 0 : 2,
    );

    return formatter.format(minorUnits / 100);
  }

  String _formatDate(BuildContext context, DateTime value) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    return DateFormat.MMMd(locale).add_jm().format(value);
  }

  String _categoryText(AppLocalizations l10n, Expense expense) {
    final value = expense.categoryId.trim();
    if (value.isEmpty) {
      return l10n.homeExpenseNoCategory;
    }
    return value;
  }

  String? _noteText(Expense expense) {
    final value = expense.note?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    this.actionLabel,
    this.onActionPressed,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        if (actionLabel != null && onActionPressed != null)
          TextButton(onPressed: onActionPressed, child: Text(actionLabel!)),
      ],
    );
  }
}
