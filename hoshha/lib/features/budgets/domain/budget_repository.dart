import 'budget.dart';

abstract class BudgetRepository {
  Future<Budget?> getBudgetForMonth(DateTime month);

  Stream<Budget?> watchBudgetForMonth(DateTime month);

  Future<Budget> saveBudget(Budget budget);
}
