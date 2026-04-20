import 'expense.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> listForMonth(DateTime month);
}
