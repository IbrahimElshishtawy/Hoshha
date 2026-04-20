import '../../../../core/async/combine_latest.dart';
import '../../../expenses/application/models/expense_query.dart';
import '../../../expenses/application/queries/get_expenses.dart';
import '../../../expenses/application/queries/get_monthly_summary.dart';
import '../../../expenses/application/services/budget_status_calculator.dart';
import '../../../expenses/application/models/monthly_summary.dart';
import '../../../expenses/domain/expense.dart';
import '../../../gamification/application/models/gamification_snapshot.dart';
import '../../../gamification/application/queries/get_gamification_snapshot.dart';
import '../models/dashboard_snapshot.dart';

class GetDashboardSnapshot {
  const GetDashboardSnapshot({
    required GetExpenses getExpenses,
    required GetMonthlySummary getMonthlySummary,
    required GetGamificationSnapshot getGamificationSnapshot,
    required BudgetStatusCalculator budgetStatusCalculator,
    required DateTime Function() now,
  }) : _getExpenses = getExpenses,
       _getMonthlySummary = getMonthlySummary,
       _getGamificationSnapshot = getGamificationSnapshot,
       _budgetStatusCalculator = budgetStatusCalculator,
       _now = now;

  final GetExpenses _getExpenses;
  final GetMonthlySummary _getMonthlySummary;
  final GetGamificationSnapshot _getGamificationSnapshot;
  final BudgetStatusCalculator _budgetStatusCalculator;
  final DateTime Function() _now;

  Future<DashboardSnapshot> call() async {
    final currentMonth = _currentMonth();
    final monthlySummary = await _getMonthlySummary(currentMonth);
    final latestExpenses = await _getExpenses(const ExpenseQuery.recent());
    final gamificationSnapshot = await _getGamificationSnapshot();

    return _buildSnapshot(
      monthlySummary: monthlySummary,
      latestExpenses: latestExpenses,
      gamificationSnapshot: gamificationSnapshot,
    );
  }

  Stream<DashboardSnapshot> watch() {
    final currentMonth = _currentMonth();

    return combineLatest3(
      _getMonthlySummary.watch(currentMonth),
      _getExpenses.watch(const ExpenseQuery.recent()),
      _getGamificationSnapshot.watch(),
      (monthlySummary, latestExpenses, gamificationSnapshot) => _buildSnapshot(
        monthlySummary: monthlySummary,
        latestExpenses: latestExpenses,
        gamificationSnapshot: gamificationSnapshot,
      ),
    );
  }

  DashboardSnapshot _buildSnapshot({
    required MonthlySummary monthlySummary,
    required List<Expense> latestExpenses,
    required GamificationSnapshot gamificationSnapshot,
  }) {
    return DashboardSnapshot(
      monthKey: monthlySummary.monthKey,
      totalMonthlySpending: monthlySummary.spentMinor,
      remainingBudget: monthlySummary.remainingMinor,
      latestExpenses: latestExpenses,
      expenseCount: monthlySummary.expenseCount,
      topCategory: monthlySummary.topCategoryId,
      averageDailySpending: monthlySummary.averageDailySpentMinor,
      budgetStatus: _budgetStatusCalculator(monthlySummary),
      budgetLimitMinor: monthlySummary.budgetMinor,
      streakDays: gamificationSnapshot.currentStreak,
      level: gamificationSnapshot.currentLevel,
      xp: gamificationSnapshot.totalXp,
    );
  }

  DateTime _currentMonth() {
    final now = _now();
    return DateTime(now.year, now.month);
  }
}
