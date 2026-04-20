import '../../../../core/time/month_key.dart';
import '../../domain/expense.dart';
import '../models/expense_group.dart';

class ExpenseGrouping {
  const ExpenseGrouping();

  List<ExpenseGroup<DateTime>> groupByDay(Iterable<Expense> expenses) {
    return _group<DateTime>(
      expenses,
      keyOf: (expense) => DateTime(
        expense.occurredAt.year,
        expense.occurredAt.month,
        expense.occurredAt.day,
      ),
      compareKeys: (left, right) => right.compareTo(left),
    );
  }

  List<ExpenseGroup<String>> groupByMonth(Iterable<Expense> expenses) {
    return _group<String>(
      expenses,
      keyOf: (expense) => monthKeyFromDate(expense.occurredAt),
      compareKeys: (left, right) => right.compareTo(left),
    );
  }

  List<ExpenseGroup<TKey>> _group<TKey>(
    Iterable<Expense> expenses, {
    required TKey Function(Expense expense) keyOf,
    required int Function(TKey left, TKey right) compareKeys,
  }) {
    final buckets = <TKey, List<Expense>>{};
    for (final expense in expenses) {
      buckets.putIfAbsent(keyOf(expense), () => <Expense>[]).add(expense);
    }

    final groups =
        buckets.entries
            .map((entry) {
              final sortedExpenses = entry.value.toList(growable: false)
                ..sort(
                  (left, right) => right.occurredAt.compareTo(left.occurredAt),
                );
              final spentMinor = sortedExpenses.fold<int>(
                0,
                (sum, expense) => sum + expense.amountMinor,
              );

              return ExpenseGroup<TKey>(
                key: entry.key,
                expenses: sortedExpenses,
                spentMinor: spentMinor,
              );
            })
            .toList(growable: false)
          ..sort((left, right) => compareKeys(left.key, right.key));

    return groups;
  }
}
