import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../theme/theme_extensions.dart';
import '../../../expenses/application/models/expense_query.dart';
import '../../../expenses/domain/expense.dart';
import '../../../expenses/expenses_providers.dart';
import '../../../expenses/presentation/controllers/add_expense_controller.dart';
import '../providers/history_filters_provider.dart';
import 'expense_group_section.dart';
import 'expense_history_tile.dart';
import 'history_empty_state.dart';
import 'history_error_state.dart';

class ExpenseHistoryList extends ConsumerWidget {
  const ExpenseHistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.appSpacing;
    final filters = ref.watch(historyFiltersProvider);
    final query = filters.expenseQuery;
    final expensesAsync = ref.watch(expenseHistoryProvider(query));
    final allExpensesAsync = ref.watch(
      expenseHistoryProvider(const ExpenseQuery()),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: expensesAsync.when(
        loading: () => const _InlineStateContainer(
          key: ValueKey('history-loading'),
          child: _HistoryLoadingState(),
        ),
        error: (error, _) => _InlineStateContainer(
          key: const ValueKey('history-error'),
          child: HistoryErrorState(
            message: 'تعذر تحميل السجل الآن.',
            onRetry: () => ref.invalidate(expenseHistoryProvider(query)),
          ),
        ),
        data: (expenses) {
          if (expenses.isEmpty) {
            return allExpensesAsync.when(
              loading: () => const _InlineStateContainer(
                key: ValueKey('history-empty-loading'),
                child: _HistoryLoadingState(),
              ),
              error: (error, _) => _InlineStateContainer(
                key: const ValueKey('history-empty-error'),
                child: HistoryErrorState(
                  message: 'تعذر تحديث حالة السجل.',
                  onRetry: () {
                    ref.invalidate(expenseHistoryProvider(query));
                    ref.invalidate(
                      expenseHistoryProvider(const ExpenseQuery()),
                    );
                  },
                ),
              ),
              data: (allExpenses) => _InlineStateContainer(
                key: ValueKey(
                  'history-empty-${filters.hasActiveFilters}-${allExpenses.length}',
                ),
                child: HistoryEmptyState(
                  icon: allExpenses.isEmpty
                      ? Icons.receipt_long_outlined
                      : Icons.filter_alt_off_rounded,
                  title: allExpenses.isEmpty
                      ? 'لا توجد مصروفات بعد'
                      : 'لا توجد نتائج مطابقة',
                  message: allExpenses.isEmpty
                      ? 'ابدأ بإضافة أول مصروف وسيظهر هنا مرتبًا حسب الأيام.'
                      : 'جرّب تعديل الفلاتر أو عرض كل الفترات لرؤية المصروفات المسجلة.',
                  actionLabel: allExpenses.isEmpty || !filters.hasActiveFilters
                      ? null
                      : 'مسح الفلاتر',
                  onActionPressed:
                      allExpenses.isEmpty || !filters.hasActiveFilters
                      ? null
                      : ref.read(historyFiltersProvider.notifier).clearFilters,
                ),
              ),
            );
          }

          final groupedExpenses = ref
              .watch(expenseGroupingProvider)
              .groupByDay(expenses);
          final categoryOptions = ref.watch(expenseCategoryOptionsProvider);
          final categoryById = {
            for (final option in categoryOptions) option.id: option,
          };
          final formatters = _HistoryFormatters(context);

          return ListView.separated(
            key: ValueKey(
              'history-list-${query.hashCode}-${expenses.length}-${filters.sort.name}',
            ),
            padding: EdgeInsetsDirectional.only(bottom: spacing.xl),
            itemCount: groupedExpenses.length,
            separatorBuilder: (context, index) => SizedBox(height: spacing.lg),
            itemBuilder: (context, index) {
              final group = groupedExpenses[index];

              return ExpenseGroupSection(
                title: formatters.groupHeader(group.key),
                totalAmountText: formatters.money(group.spentMinor),
                children: group.expenses
                    .map(
                      (expense) => ExpenseHistoryTile(
                        amountText: formatters.money(expense.amountMinor),
                        categoryText: _categoryLabel(categoryById, expense),
                        timeText: formatters.time(expense.occurredAt),
                        noteText: _noteText(expense),
                        icon: _categoryIcon(categoryById, expense),
                      ),
                    )
                    .toList(growable: false),
              );
            },
          );
        },
      ),
    );
  }

  String _categoryLabel(
    Map<String, ExpenseCategoryOption> categoryById,
    Expense expense,
  ) {
    final value = expense.categoryId.trim();
    if (value.isEmpty) {
      return 'بدون تصنيف';
    }

    return categoryById[value]?.label ?? value;
  }

  IconData _categoryIcon(
    Map<String, ExpenseCategoryOption> categoryById,
    Expense expense,
  ) {
    final value = expense.categoryId.trim();
    return categoryById[value]?.icon ?? Icons.category_rounded;
  }

  String? _noteText(Expense expense) {
    final value = expense.note?.trim();
    if (value == null || value.isEmpty) {
      return null;
    }

    return value;
  }
}

class _InlineStateContainer extends StatelessWidget {
  const _InlineStateContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _HistoryLoadingState extends StatelessWidget {
  const _HistoryLoadingState();

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final spacing = context.appSpacing;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: spacing.xl,
          height: spacing.xl,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: colors.primary,
          ),
        ),
        SizedBox(height: spacing.md),
        Text(
          'جاري تحميل السجل...',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _HistoryFormatters {
  _HistoryFormatters(BuildContext context)
    : _locale = Localizations.localeOf(context).toLanguageTag();

  final String _locale;

  String money(int minorUnits) {
    final formatter = NumberFormat.currency(
      locale: _locale,
      symbol: _locale.startsWith('ar') ? 'ج.م' : 'EGP',
      decimalDigits: minorUnits % 100 == 0 ? 0 : 2,
    );

    return formatter.format(minorUnits / 100);
  }

  String time(DateTime dateTime) {
    return DateFormat.jm(_locale).format(dateTime);
  }

  String groupHeader(DateTime day) {
    final formatter = DateFormat.yMMMMEEEEd(_locale);
    return formatter.format(day);
  }
}
