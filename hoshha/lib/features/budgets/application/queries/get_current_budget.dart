import '../../domain/budget_repository.dart';
import '../../domain/monthly_budget.dart';

class GetCurrentBudget {
  const GetCurrentBudget(this._repository);

  final BudgetRepository _repository;

  Future<MonthlyBudget?> call(DateTime month) async {
    final budget = await _repository.getBudgetForMonth(month);
    if (budget == null) {
      return null;
    }

    return MonthlyBudget(month: DateTime(month.year, month.month), limitMinor: budget.limitMinor);
  }
}
