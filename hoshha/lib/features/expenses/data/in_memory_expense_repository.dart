import '../../../core/time/clock.dart';
import '../domain/expense.dart';
import '../domain/expense_repository.dart';

class InMemoryExpenseRepository implements ExpenseRepository {
  InMemoryExpenseRepository(this._clock);

  final Clock _clock;

  @override
  Future<List<Expense>> listForMonth(DateTime month) async {
    final start = DateTime(month.year, month.month);
    final end = DateTime(month.year, month.month + 1);

    return _seedExpenses()
        .where(
          (expense) =>
              !expense.occurredAt.isBefore(start) &&
              expense.occurredAt.isBefore(end),
        )
        .toList(growable: false);
  }

  List<Expense> _seedExpenses() {
    final now = _clock.now();

    return [
      Expense(
        id: 'expense-groceries',
        amount: 320,
        category: 'Groceries',
        occurredAt: now.subtract(const Duration(days: 1)),
      ),
      Expense(
        id: 'expense-transport',
        amount: 140,
        category: 'Transport',
        occurredAt: now.subtract(const Duration(days: 3)),
      ),
      Expense(
        id: 'expense-coffee',
        amount: 85,
        category: 'Coffee',
        occurredAt: now.subtract(const Duration(days: 5)),
      ),
      Expense(
        id: 'expense-previous-month',
        amount: 210,
        category: 'Shopping',
        occurredAt: DateTime(now.year, now.month - 1, 28),
      ),
    ];
  }
}
