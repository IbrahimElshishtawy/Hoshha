import 'budget.dart';

abstract class BudgetRepository {
  Future<Budget?> getBudgetForMonth(DateTime month);

  Future<Budget> saveBudget(Budget budget);
}
