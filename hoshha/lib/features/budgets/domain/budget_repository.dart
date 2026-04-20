import 'monthly_budget.dart';

abstract class BudgetRepository {
  Future<MonthlyBudget> getForMonth(DateTime month);
}
