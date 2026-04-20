import '../../expenses/application/queries/get_monthly_summary.dart';
import '../../gamification/application/queries/get_gamification_snapshot.dart';
import '../domain/dashboard_snapshot.dart';

class GetDashboardSnapshot {
  const GetDashboardSnapshot({
    required this.getMonthlySummary,
    required this.getGamificationSnapshot,
    required this.now,
  });

  final GetMonthlySummary getMonthlySummary;
  final GetGamificationSnapshot getGamificationSnapshot;
  final DateTime Function() now;

  Future<DashboardSnapshot> call() async {
    final current = now();
    final currentMonth = DateTime(current.year, current.month);
    final monthlySummary = await getMonthlySummary(currentMonth);
    final gamificationSnapshot = await getGamificationSnapshot();

    return DashboardSnapshot(
      month: currentMonth,
      totalSpentMinor: monthlySummary.totalSpentMinor,
      budgetLimitMinor: monthlySummary.budgetLimitMinor ?? 0,
      remainingBudgetMinor: monthlySummary.remainingBudgetMinor,
      transactionCount: monthlySummary.expenseCount,
      streakDays: gamificationSnapshot.streak.currentCount,
      level: gamificationSnapshot.stats.level,
      xp: gamificationSnapshot.stats.totalXp,
    );
  }
}
