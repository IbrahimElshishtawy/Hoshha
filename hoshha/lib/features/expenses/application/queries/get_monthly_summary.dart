import '../../../../core/async/combine_latest.dart';
import '../../../budgets/domain/budget_repository.dart';
import '../models/date_range.dart';
import '../models/expense_query.dart';
import '../services/expense_aggregator.dart';
import '../models/monthly_summary.dart';
import '../../domain/expense_repository.dart';

class GetMonthlySummary {
  const GetMonthlySummary({
    required ExpensesRepository expensesRepository,
    required BudgetRepository budgetRepository,
    required ExpenseAggregator expenseAggregator,
  }) : _expensesRepository = expensesRepository,
       _budgetRepository = budgetRepository,
       _expenseAggregator = expenseAggregator;

  final ExpensesRepository _expensesRepository;
  final BudgetRepository _budgetRepository;
  final ExpenseAggregator _expenseAggregator;

  Future<MonthlySummary> call(DateTime month) async {
    final normalizedMonth = DateTime(month.year, month.month);
    final expenses = await _expensesRepository.getExpenses(
      ExpenseQuery(dateRange: DateRange.month(normalizedMonth)),
    );
    final budget = await _budgetRepository.getBudgetForMonth(normalizedMonth);

    return _expenseAggregator.buildMonthlySummary(
      month: normalizedMonth,
      expenses: expenses,
      budget: budget,
    );
  }

  Stream<MonthlySummary> watch(DateTime month) {
    final normalizedMonth = DateTime(month.year, month.month);
    final query = ExpenseQuery(dateRange: DateRange.month(normalizedMonth));

    return combineLatest2(
      _expensesRepository.watchExpenses(query),
      _budgetRepository.watchBudgetForMonth(normalizedMonth),
      (expenses, budget) => _expenseAggregator.buildMonthlySummary(
        month: normalizedMonth,
        expenses: expenses,
        budget: budget,
      ),
    );
  }
}
