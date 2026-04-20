import '../domain/budget_repository.dart';
import '../domain/monthly_budget.dart';

class InMemoryBudgetRepository implements BudgetRepository {
  @override
  Future<MonthlyBudget> getForMonth(DateTime month) async {
    return MonthlyBudget(month: DateTime(month.year, month.month), limit: 4000);
  }
}
