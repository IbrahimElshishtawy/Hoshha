import '../../../budgets/domain/budget_repository.dart';
import '../models/date_range.dart';
import '../models/monthly_summary.dart';
import '../../domain/expense_repository.dart';

class GetMonthlySummary {
  const GetMonthlySummary({
    required ExpensesRepository expensesRepository,
    required BudgetRepository budgetRepository,
  }) : _expensesRepository = expensesRepository,
       _budgetRepository = budgetRepository;

  final ExpensesRepository _expensesRepository;
  final BudgetRepository _budgetRepository;

  Future<MonthlySummary> call(DateTime month) async {
    final normalizedMonth = DateTime(month.year, month.month);
    final range = DateRange(
      start: normalizedMonth,
      end: DateTime(month.year, month.month + 1),
    );
    final expenses = await _expensesRepository.getExpensesByDateRange(range);
    final budget = await _budgetRepository.getBudgetForMonth(normalizedMonth);
    final totalSpentMinor = expenses.fold<int>(
      0,
      (sum, expense) => sum + expense.amountMinor,
    );

    return MonthlySummary(
      month: normalizedMonth,
      totalSpentMinor: totalSpentMinor,
      expenseCount: expenses.length,
      budgetLimitMinor: budget?.limitMinor,
    );
  }
}
