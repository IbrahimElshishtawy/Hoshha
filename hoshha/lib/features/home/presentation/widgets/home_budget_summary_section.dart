import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';

import '../../../budgets/budget_providers.dart';
import '../../../expenses/application/models/budget_status.dart';
import '../../../expenses/application/models/monthly_summary.dart';
import '../../../expenses/expenses_providers.dart';
import 'budget_summary_card.dart';
import 'home_section_error.dart';
import 'home_section_skeleton.dart';

class HomeBudgetSummarySection extends ConsumerWidget {
  const HomeBudgetSummarySection({
    super.key,
    required this.onBudgetActionPressed,
  });

  final VoidCallback onBudgetActionPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final summaryAsync = ref.watch(monthlySummaryProvider);
    final hasStoredBudget = ref.watch(
      currentBudgetProvider.select((value) => value.asData?.value != null),
    );

    return summaryAsync.when(
      loading: () => const HomeSectionSkeleton.card(),
      error: (error, _) => HomeSectionError(
        title: l10n.homeBudgetSectionTitle,
        message: l10n.homeSectionLoadFailure(l10n.homeBudgetSectionTitle),
        retryLabel: l10n.homeRetry,
        onRetry: () {
          ref.invalidate(monthlySummaryProvider);
          ref.invalidate(currentBudgetProvider);
        },
      ),
      data: (summary) => _buildCard(
        context: context,
        ref: ref,
        summary: summary,
        l10n: l10n,
        actionLabel: hasStoredBudget
            ? l10n.homeBudgetEditAction
            : l10n.homeBudgetSetAction,
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required WidgetRef ref,
    required MonthlySummary summary,
    required AppLocalizations l10n,
    required String actionLabel,
  }) {
    if (!summary.hasBudget) {
      return BudgetSummaryCard.setup(
        title: l10n.homeBudgetSectionTitle,
        setupTitle: l10n.homeBudgetNoBudgetTitle,
        setupMessage: l10n.homeBudgetNoBudgetMessage,
        actionLabel: actionLabel,
        onActionPressed: onBudgetActionPressed,
      );
    }

    final status = ref.read(budgetStatusCalculatorProvider).call(summary);
    final spentValue = _formatMoney(context, summary.spentMinor);
    final remainingMinor = summary.remainingBudgetMinor < 0
        ? 0
        : summary.remainingBudgetMinor;
    final remainingValue = _formatMoney(context, remainingMinor);
    final progress = summary.budgetLimitMinor == 0
        ? 0.0
        : summary.spentMinor / summary.budgetLimitMinor;
    final overflowMinor = summary.spentMinor > summary.budgetLimitMinor
        ? summary.spentMinor - summary.budgetLimitMinor
        : 0;

    return BudgetSummaryCard(
      title: l10n.homeBudgetSectionTitle,
      spentLabel: l10n.homeBudgetSpentLabel,
      spentValue: spentValue,
      remainingLabel: l10n.homeBudgetRemainingLabel,
      remainingValue: remainingValue,
      limitLabel: l10n.homeBudgetLimitLabel(
        _formatMoney(context, summary.budgetLimitMinor),
      ),
      progress: progress.clamp(0.0, 1.0),
      statusLabel: _statusLabel(l10n, status),
      tone: _toneFromStatus(status),
      overflowMessage: overflowMinor > 0
          ? l10n.homeBudgetOverflowMessage(_formatMoney(context, overflowMinor))
          : null,
      actionLabel: actionLabel,
      onActionPressed: onBudgetActionPressed,
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

  String _statusLabel(AppLocalizations l10n, BudgetStatus status) {
    return switch (status) {
      BudgetStatus.safe => l10n.homeBudgetStatusSafe,
      BudgetStatus.warning => l10n.homeBudgetStatusWarning,
      BudgetStatus.exceeded => l10n.homeBudgetStatusExceeded,
    };
  }

  BudgetSummaryTone _toneFromStatus(BudgetStatus status) {
    return switch (status) {
      BudgetStatus.safe => BudgetSummaryTone.safe,
      BudgetStatus.warning => BudgetSummaryTone.warning,
      BudgetStatus.exceeded => BudgetSummaryTone.exceeded,
    };
  }
}
