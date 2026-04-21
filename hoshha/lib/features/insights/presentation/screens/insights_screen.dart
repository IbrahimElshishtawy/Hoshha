import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../../app/router/app_router.dart';
import '../../../../theme/theme_extensions.dart';
import '../../../expenses/application/models/budget_status.dart';
import '../../../expenses/application/models/monthly_summary.dart';
import '../../../expenses/expenses_providers.dart';
import '../../../expenses/presentation/controllers/add_expense_controller.dart';
import '../widgets/average_spending_card.dart';
import '../widgets/budget_status_card.dart';
import '../widgets/insights_empty_state.dart';
import '../widgets/insights_error_state.dart';
import '../widgets/insights_summary_card.dart';
import '../widgets/top_category_card.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  static const _maxContentWidth = 720.0;
  static const _switchDuration = Duration(milliseconds: 220);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.appSpacing;
    final summaryAsync = ref.watch(monthlySummaryProvider);
    final isEmpty = summaryAsync.asData?.value.expenseCount == 0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('تحليلات')),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(monthlySummaryProvider);
              ref.invalidate(budgetStatusProvider);
            },
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _maxContentWidth),
                child: AnimatedSwitcher(
                  duration: _switchDuration,
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: isEmpty
                      ? SingleChildScrollView(
                          key: const ValueKey('insights-empty-state'),
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsetsDirectional.all(spacing.lg),
                          child: InsightsEmptyState(
                            title: 'مفيش بيانات كفاية لعرض التحليلات',
                            message:
                                'أول ما تبدأ تضيف مصاريف، هنقدر نوضحلك الصرف والميزانية بشكل أبسط.',
                            actionLabel: 'ابدأ بإضافة مصروف',
                            onActionPressed: () =>
                                context.push(AppRoutes.addExpense),
                          ),
                        )
                      : CustomScrollView(
                          key: const ValueKey('insights-content'),
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            SliverPadding(
                              padding: EdgeInsetsDirectional.only(
                                start: spacing.lg,
                                top: spacing.lg,
                                end: spacing.lg,
                                bottom: spacing.xl,
                              ),
                              sliver: SliverList.list(
                                children: [
                                  const _SummarySection(),
                                  SizedBox(height: spacing.lg),
                                  const _TopCategorySection(),
                                  SizedBox(height: spacing.lg),
                                  const _AverageSpendingSection(),
                                  SizedBox(height: spacing.lg),
                                  const _BudgetStatusSection(),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SummarySection extends ConsumerWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(monthlySummaryProvider);

    return AnimatedSwitcher(
      duration: InsightsScreen._switchDuration,
      transitionBuilder: _fadeTransition,
      child: summaryAsync.when(
        loading: () =>
            const InsightsSummaryCard.loading(key: ValueKey('summary-loading')),
        error: (_, _) => InsightsErrorState(
          key: const ValueKey('summary-error'),
          title: 'ملخص الشهر',
          message: 'حصلت مشكلة وإحنا بنحمّل ملخص الشهر الحالي.',
          retryLabel: 'حاول تاني',
          onRetry: () => ref.invalidate(monthlySummaryProvider),
        ),
        data: (summary) => InsightsSummaryCard(
          key: ValueKey(
            'summary-${summary.monthKey}-${summary.spentMinor}-${summary.expenseCount}',
          ),
          title: 'ملخص الشهر الحالي',
          subtitle: _formatMonth(context, summary.month),
          spentValue: _formatMoney(context, summary.spentMinor),
          budgetValue: summary.hasBudget
              ? _formatMoney(context, summary.budgetLimitMinor)
              : 'غير محددة',
          remainingValue: _remainingValue(context, summary),
          expenseCountValue: _formatCount(context, summary.expenseCount),
          spentSubtitle: 'إجمالي اللي اتصرف لحد دلوقتي',
          budgetSubtitle: summary.hasBudget
              ? 'الحد اللي محدده للشهر'
              : 'لسه مفيش ميزانية متسجلة',
          remainingSubtitle: _remainingSubtitle(summary),
          expenseCountSubtitle: 'عدد المصاريف المسجلة',
        ),
      ),
    );
  }
}

class _TopCategorySection extends ConsumerWidget {
  const _TopCategorySection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(monthlySummaryProvider);
    final categoryOptions = ref.watch(expenseCategoryOptionsProvider);

    return AnimatedSwitcher(
      duration: InsightsScreen._switchDuration,
      transitionBuilder: _fadeTransition,
      child: summaryAsync.when(
        loading: () => const TopCategoryCard.loading(
          key: ValueKey('top-category-loading'),
        ),
        error: (_, _) => InsightsErrorState(
          key: const ValueKey('top-category-error'),
          title: 'أكتر فئة صرف',
          message: 'حصلت مشكلة وإحنا بنجهز الفئة الأعلى صرفًا.',
          retryLabel: 'حاول تاني',
          onRetry: () => ref.invalidate(monthlySummaryProvider),
        ),
        data: (summary) {
          final topCategoryId = summary.topCategoryId?.trim();
          if (topCategoryId == null || topCategoryId.isEmpty) {
            return const TopCategoryCard.empty(
              key: ValueKey('top-category-empty'),
              title: 'أكتر فئة صرف',
              message: 'لسه مفيش بيانات كفاية تحدد فئة واضحة.',
            );
          }

          final category = categoryOptions
              .cast<ExpenseCategoryOption?>()
              .firstWhere(
                (option) => option?.id == topCategoryId,
                orElse: () => null,
              );
          final share = summary.spentMinor == 0
              ? 0.0
              : summary.topCategorySpentMinor / summary.spentMinor;

          return TopCategoryCard(
            key: ValueKey(
              'top-category-${summary.monthKey}-$topCategoryId-${summary.topCategorySpentMinor}',
            ),
            title: 'أكتر فئة صرف',
            categoryLabel: category?.label ?? topCategoryId,
            amountLabel: _formatMoney(context, summary.topCategorySpentMinor),
            subtitle:
                '${_formatCount(context, summary.topCategoryExpenseCount)} مصروف في الفئة دي',
            supportingLabel: share > 0
                ? 'حوالي ${_formatPercent(context, share)} من صرف الشهر'
                : null,
            icon: category?.icon ?? Icons.category_rounded,
          );
        },
      ),
    );
  }
}

class _AverageSpendingSection extends ConsumerWidget {
  const _AverageSpendingSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(monthlySummaryProvider);

    return AnimatedSwitcher(
      duration: InsightsScreen._switchDuration,
      transitionBuilder: _fadeTransition,
      child: summaryAsync.when(
        loading: () => const AverageSpendingCard.loading(
          key: ValueKey('average-spending-loading'),
        ),
        error: (_, _) => InsightsErrorState(
          key: const ValueKey('average-spending-error'),
          title: 'متوسط الصرف اليومي',
          message: 'مش قادرين نحسب متوسط الصرف اليومي دلوقتي.',
          retryLabel: 'حاول تاني',
          onRetry: () => ref.invalidate(monthlySummaryProvider),
        ),
        data: (summary) => AverageSpendingCard(
          key: ValueKey(
            'average-spending-${summary.monthKey}-${summary.averageDailySpentMinor}',
          ),
          title: 'متوسط الصرف اليومي',
          value: _formatMoney(context, summary.averageDailySpentMinor),
          subtitle: 'محسوب على عدد أيام الشهر الحالي بالكامل.',
        ),
      ),
    );
  }
}

class _BudgetStatusSection extends ConsumerWidget {
  const _BudgetStatusSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(monthlySummaryProvider);
    final statusAsync = ref.watch(budgetStatusProvider);
    final colors = context.appColors;

    if (summaryAsync.isLoading) {
      return const BudgetStatusCard.loading(
        key: ValueKey('budget-status-loading'),
      );
    }

    if (summaryAsync.hasError) {
      return InsightsErrorState(
        key: const ValueKey('budget-status-summary-error'),
        title: 'حالة الميزانية',
        message: 'حصلت مشكلة وإحنا بنحدد حالة الميزانية الحالية.',
        retryLabel: 'حاول تاني',
        onRetry: () {
          ref.invalidate(monthlySummaryProvider);
          ref.invalidate(budgetStatusProvider);
        },
      );
    }

    final summary = summaryAsync.requireValue;
    if (!summary.hasBudget) {
      return BudgetStatusCard(
        key: const ValueKey('budget-status-no-budget'),
        title: 'حالة الميزانية',
        statusLabel: 'بدون ميزانية',
        message: 'حدد ميزانية للشهر الحالي علشان نوضحلك وضعك بشكل أدق.',
        progressLabel:
            'إجمالي الصرف الحالي ${_formatMoney(context, summary.spentMinor)}',
        detailLabel: 'بعد تحديد الميزانية هتظهر حالة الصرف بشكل أوضح.',
        progress: 0,
        icon: Icons.account_balance_wallet_outlined,
        accentColor: colors.secondary,
      );
    }

    return AnimatedSwitcher(
      duration: InsightsScreen._switchDuration,
      transitionBuilder: _fadeTransition,
      child: statusAsync.when(
        loading: () => const BudgetStatusCard.loading(
          key: ValueKey('budget-status-async-loading'),
        ),
        error: (_, _) => InsightsErrorState(
          key: const ValueKey('budget-status-error'),
          title: 'حالة الميزانية',
          message: 'حصلت مشكلة وإحنا بنحسب حالة الميزانية.',
          retryLabel: 'حاول تاني',
          onRetry: () {
            ref.invalidate(monthlySummaryProvider);
            ref.invalidate(budgetStatusProvider);
          },
        ),
        data: (status) {
          final ratio = summary.budgetLimitMinor == 0
              ? 0.0
              : summary.spentMinor / summary.budgetLimitMinor;
          final config = _statusViewData(context, status);

          return BudgetStatusCard(
            key: ValueKey(
              'budget-status-${summary.monthKey}-${summary.spentMinor}-${status.name}',
            ),
            title: 'حالة الميزانية',
            statusLabel: config.label,
            message: config.message,
            progressLabel:
                'استهلكت ${_formatPercent(context, ratio)} من الميزانية',
            detailLabel: _budgetDetailLabel(context, summary),
            progress: ratio.clamp(0, 1),
            icon: config.icon,
            accentColor: config.color,
          );
        },
      ),
    );
  }
}

class _BudgetStatusViewData {
  const _BudgetStatusViewData({
    required this.label,
    required this.message,
    required this.icon,
    required this.color,
  });

  final String label;
  final String message;
  final IconData icon;
  final Color color;
}

_BudgetStatusViewData _statusViewData(
  BuildContext context,
  BudgetStatus status,
) {
  final colors = context.appColors;

  return switch (status) {
    BudgetStatus.safe => _BudgetStatusViewData(
      label: 'آمن',
      message: 'أنت لسه جوه الميزانية وماشي كويس.',
      icon: Icons.verified_rounded,
      color: colors.success,
    ),
    BudgetStatus.warning => _BudgetStatusViewData(
      label: 'تنبيه',
      message: 'قربت من حد الميزانية، فخلي بالك من الصرف الجاي.',
      icon: Icons.warning_amber_rounded,
      color: colors.warning,
    ),
    BudgetStatus.exceeded => _BudgetStatusViewData(
      label: 'متجاوز',
      message: 'عديت الميزانية الحالية، ومحتاج تهدي الصرف شوية.',
      icon: Icons.error_outline_rounded,
      color: colors.error,
    ),
  };
}

Widget _fadeTransition(Widget child, Animation<double> animation) {
  return FadeTransition(opacity: animation, child: child);
}

String _formatMoney(BuildContext context, num minorUnits) {
  final locale = Localizations.localeOf(context).toLanguageTag();
  final majorUnits = minorUnits / 100;
  final hasDecimals = (majorUnits - majorUnits.roundToDouble()).abs() > 0.001;
  final formatter = NumberFormat.currency(
    locale: locale,
    symbol: locale.startsWith('ar') ? 'ج.م' : 'EGP',
    decimalDigits: hasDecimals ? 2 : 0,
  );

  return formatter.format(majorUnits);
}

String _formatCount(BuildContext context, int value) {
  final locale = Localizations.localeOf(context).toLanguageTag();
  return NumberFormat.decimalPattern(locale).format(value);
}

String _formatMonth(BuildContext context, DateTime month) {
  final locale = Localizations.localeOf(context).toLanguageTag();
  return DateFormat.yMMMM(locale).format(month);
}

String _formatPercent(BuildContext context, double value) {
  final locale = Localizations.localeOf(context).toLanguageTag();
  final formatter = NumberFormat.percentPattern(locale)
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 0;

  return formatter.format(value);
}

String _remainingValue(BuildContext context, MonthlySummary summary) {
  if (!summary.hasBudget) {
    return 'غير محسوب';
  }

  if (summary.remainingBudgetMinor >= 0) {
    return _formatMoney(context, summary.remainingBudgetMinor);
  }

  return '-${_formatMoney(context, summary.remainingBudgetMinor.abs())}';
}

String _remainingSubtitle(MonthlySummary summary) {
  if (!summary.hasBudget) {
    return 'هيظهر بعد ما تحدد ميزانية';
  }

  return summary.remainingBudgetMinor >= 0
      ? 'المتاح لسه من الميزانية'
      : 'زيادة عن الحد المحدد';
}

String _budgetDetailLabel(BuildContext context, MonthlySummary summary) {
  if (summary.remainingBudgetMinor >= 0) {
    return 'المتبقي ${_formatMoney(context, summary.remainingBudgetMinor)}';
  }

  return 'زيادة ${_formatMoney(context, summary.remainingBudgetMinor.abs())} عن الميزانية';
}
