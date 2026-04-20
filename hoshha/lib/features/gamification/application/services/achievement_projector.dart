import '../../../budgets/domain/budget.dart';
import '../../../expenses/application/models/monthly_summary.dart';
import '../../domain/achievement_progress.dart';
import '../../domain/streak.dart';
import '../../domain/user_stats.dart';

class AchievementProjector {
  const AchievementProjector();

  List<AchievementProgress> project({
    required DateTime now,
    required UserStats stats,
    required Streak streak,
    required List<AchievementProgress> current,
    Budget? budget,
    MonthlySummary? monthlySummary,
  }) {
    final currentById = {
      for (final achievement in current) achievement.achievementId: achievement,
    };

    return AchievementId.values
        .map(
          (achievementId) => _projectSingle(
            achievementId: achievementId,
            current: currentById[achievementId],
            now: now,
            stats: stats,
            streak: streak,
            budget: budget,
            monthlySummary: monthlySummary,
          ),
        )
        .toList(growable: false);
  }

  List<AchievementProgress> seed(DateTime now, List<AchievementProgress> current) {
    return project(
      now: now,
      stats: UserStats(
        totalXp: 0,
        level: 1,
        totalExpensesCount: 0,
        totalSpentMinor: 0,
        createdAt: now,
        updatedAt: now,
      ),
      streak: Streak(
        type: StreakType.expenseLogging,
        currentCount: 0,
        bestCount: 0,
        createdAt: now,
        updatedAt: now,
      ),
      current: current,
    );
  }

  AchievementProgress _projectSingle({
    required AchievementId achievementId,
    required AchievementProgress? current,
    required DateTime now,
    required UserStats stats,
    required Streak streak,
    required Budget? budget,
    required MonthlySummary? monthlySummary,
  }) {
    final (progress, shouldUnlock) = switch (achievementId) {
      AchievementId.firstExpense => (
        stats.totalExpensesCount > 0 ? 1 : 0,
        stats.totalExpensesCount > 0,
      ),
      AchievementId.fiveExpenses => (
        stats.totalExpensesCount > 5 ? 5 : stats.totalExpensesCount,
        stats.totalExpensesCount >= 5,
      ),
      AchievementId.firstBudgetSet => (budget == null ? 0 : 1, budget != null),
      AchievementId.sevenDayExpenseStreak => (
        streak.currentCount > 7 ? 7 : streak.currentCount,
        streak.currentCount >= 7,
      ),
      AchievementId.underBudgetMonth => (
        _underBudgetProgress(budget: budget, monthlySummary: monthlySummary, now: now),
        _isUnderBudgetMonthCompleted(
          budget: budget,
          monthlySummary: monthlySummary,
          now: now,
        ),
      ),
    };

    final wasUnlocked = current?.isUnlocked ?? false;
    final isUnlocked = wasUnlocked || shouldUnlock;
    final unlockedAt = wasUnlocked
        ? current?.unlockedAt
        : (isUnlocked ? now : null);

    return AchievementProgress(
      achievementId: achievementId,
      progress: progress,
      isUnlocked: isUnlocked,
      createdAt: current?.createdAt ?? now,
      updatedAt: now,
      unlockedAt: unlockedAt,
    );
  }

  int _underBudgetProgress({
    required Budget? budget,
    required MonthlySummary? monthlySummary,
    required DateTime now,
  }) {
    return _isUnderBudgetMonthCompleted(
      budget: budget,
      monthlySummary: monthlySummary,
      now: now,
    )
        ? 1
        : 0;
  }

  bool _isUnderBudgetMonthCompleted({
    required Budget? budget,
    required MonthlySummary? monthlySummary,
    required DateTime now,
  }) {
    if (budget == null || monthlySummary == null) {
      return false;
    }

    final currentMonthStart = DateTime(now.year, now.month);
    final summaryMonthStart = DateTime(
      monthlySummary.month.year,
      monthlySummary.month.month,
    );

    return summaryMonthStart.isBefore(currentMonthStart) &&
        monthlySummary.expenseCount > 0 &&
        monthlySummary.totalSpentMinor <= budget.limitMinor;
  }
}
