import '../application/models/date_range.dart';
import '../application/models/expense_query.dart';
import 'expense.dart';

abstract class ExpensesRepository {
  Future<Expense?> getById(String expenseId);

  Future<List<Expense>> getExpenses(ExpenseQuery query);

  Stream<List<Expense>> watchExpenses(ExpenseQuery query);

  Future<List<Expense>> getExpensesByDateRange(DateRange range) {
    return getExpenses(ExpenseQuery(dateRange: range));
  }

  Future<List<Expense>> getRecentExpenses({int limit = 5}) {
    return getExpenses(ExpenseQuery.recent(limit: limit));
  }

  Future<Expense> saveExpense(Expense expense);

  Future<void> deleteExpense(String expenseId);
}
