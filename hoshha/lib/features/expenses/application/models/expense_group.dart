import '../../domain/expense.dart';

class ExpenseGroup<TKey> {
  const ExpenseGroup({
    required this.key,
    required this.expenses,
    required this.spentMinor,
  });

  final TKey key;
  final List<Expense> expenses;
  final int spentMinor;

  int get expenseCount => expenses.length;
}
