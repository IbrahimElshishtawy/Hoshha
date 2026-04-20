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
    final createdAt = now.subtract(const Duration(days: 7));

    return [
      Expense(
        id: 'expense-groceries',
        amountMinor: 32000,
        categoryId: 'groceries',
        occurredAt: now.subtract(const Duration(days: 1)),
        createdAt: createdAt,
        updatedAt: now,
      ),
      Expense(
        id: 'expense-transport',
        amountMinor: 14000,
        categoryId: 'transport',
        occurredAt: now.subtract(const Duration(days: 3)),
        createdAt: createdAt,
        updatedAt: now,
      ),
      Expense(
        id: 'expense-coffee',
        amountMinor: 8500,
        categoryId: 'coffee',
        occurredAt: now.subtract(const Duration(days: 5)),
        createdAt: createdAt,
        updatedAt: now,
      ),
      Expense(
        id: 'expense-previous-month',
        amountMinor: 21000,
        categoryId: 'shopping',
        occurredAt: DateTime(now.year, now.month - 1, 28),
        createdAt: createdAt,
        updatedAt: now,
      ),
    ];
  }
}
