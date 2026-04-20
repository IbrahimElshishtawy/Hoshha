import '../application/models/date_range.dart';
import '../application/models/expense_query.dart';
import 'expense.dart';

abstract class ExpensesRepository {
  Future<Expense?> getById(String expenseId);

  Future<List<Expense>> getExpenses(ExpenseQuery query);

  Future<List<Expense>> getExpensesByDateRange(DateRange range);

  Future<List<Expense>> getRecentExpenses({int limit = 5});

  Future<Expense> saveExpense(Expense expense);

  Future<void> deleteExpense(String expenseId);
}
