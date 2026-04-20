import '../../budgets/domain/budget_repository.dart';
import '../../expenses/domain/expense_repository.dart';
import '../../gamification/domain/progress_repository.dart';
import '../domain/dashboard_snapshot.dart';

class LoadDashboardSnapshot {
  const LoadDashboardSnapshot({
    required this.expenseRepository,
    required this.budgetRepository,
    required this.progressRepository,
    required this.now,
  });

  final ExpenseRepository expenseRepository;
  final BudgetRepository budgetRepository;
  final ProgressRepository progressRepository;
  final DateTime Function() now;

  Future<DashboardSnapshot> call() async {
    final current = now();
    final currentMonth = DateTime(current.year, current.month);

    final expenses = await expenseRepository.listForMonth(currentMonth);
    final budget = await budgetRepository.getForMonth(currentMonth);
    final progress = await progressRepository.getProgress();

    final totalSpent = expenses.fold<double>(
      0,
      (sum, expense) => sum + expense.amount,
    );

    return DashboardSnapshot(
      month: currentMonth,
      totalSpent: totalSpent,
      budgetLimit: budget.limit,
      remainingBudget: budget.limit - totalSpent,
      transactionCount: expenses.length,
      streakDays: progress.streakDays,
      level: progress.level,
      xp: progress.xp,
    );
  }
}
