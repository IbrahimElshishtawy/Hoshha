import '../../../expenses/application/models/budget_status.dart';
import '../../../expenses/domain/expense.dart';

class DashboardSnapshot {
  const DashboardSnapshot({
    required this.monthKey,
    required this.totalMonthlySpending,
    required this.remainingBudget,
    required this.latestExpenses,
    required this.expenseCount,
    required this.topCategory,
    required this.averageDailySpending,
    required this.budgetStatus,
    required this.budgetLimitMinor,
    this.streakDays = 0,
    this.level = 1,
    this.xp = 0,
  });

  final String monthKey;
  final int totalMonthlySpending;
  final int remainingBudget;
  final List<Expense> latestExpenses;
  final int expenseCount;
  final String? topCategory;
  final double averageDailySpending;
  final BudgetStatus budgetStatus;
  final int budgetLimitMinor;
  final int streakDays;
  final int level;
  final int xp;

  double get totalSpent => totalMonthlySpending / 100;

  double get budgetLimit => budgetLimitMinor / 100;

  int get transactionCount => expenseCount;
}
