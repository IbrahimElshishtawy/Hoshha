import '../../../budgets/domain/budget.dart';
import '../../../budgets/domain/budget_repository.dart';
import '../../../expenses/application/queries/get_monthly_summary.dart';
import '../../domain/achievement_progress.dart';
import '../../domain/achievements_repository.dart';
import '../../domain/streak.dart';
import '../../domain/streak_repository.dart';
import '../../domain/user_stats_repository.dart';
import '../services/achievement_projector.dart';
import '../services/streak_projector.dart';
import '../services/user_stats_projector.dart';

class EvaluateAchievements {
  const EvaluateAchievements({
    required AchievementsRepository achievementsRepository,
    required UserStatsRepository userStatsRepository,
    required StreakRepository streakRepository,
    required BudgetRepository budgetRepository,
    required GetMonthlySummary getMonthlySummary,
    required UserStatsProjector userStatsProjector,
    required StreakProjector streakProjector,
    required AchievementProjector achievementProjector,
    required DateTime Function() now,
  }) : _achievementsRepository = achievementsRepository,
       _userStatsRepository = userStatsRepository,
       _streakRepository = streakRepository,
       _budgetRepository = budgetRepository,
       _getMonthlySummary = getMonthlySummary,
       _userStatsProjector = userStatsProjector,
       _streakProjector = streakProjector,
       _achievementProjector = achievementProjector,
       _now = now;

  final AchievementsRepository _achievementsRepository;
  final UserStatsRepository _userStatsRepository;
  final StreakRepository _streakRepository;
  final BudgetRepository _budgetRepository;
  final GetMonthlySummary _getMonthlySummary;
  final UserStatsProjector _userStatsProjector;
  final StreakProjector _streakProjector;
  final AchievementProjector _achievementProjector;
  final DateTime Function() _now;

  Future<List<AchievementProgress>> call({
    Budget? budgetOverride,
    DateTime? month,
  }) async {
    final now = _now();
    final targetMonth = DateTime((month ?? now).year, (month ?? now).month);
    final stats =
        await _userStatsRepository.getUserStats() ??
        _userStatsProjector.initial(now);
    final streak =
        await _streakRepository.getStreak(StreakType.expenseLogging) ??
        _streakProjector.initial(now);
    final currentAchievements = await _achievementsRepository.getAchievements();
    final budget =
        budgetOverride ??
        await _budgetRepository.getBudgetForMonth(targetMonth);
    final monthlySummary = await _getMonthlySummary(targetMonth);
    final achievements = _achievementProjector.project(
      now: now,
      stats: stats,
      streak: streak,
      current: currentAchievements,
      budget: budget,
      monthlySummary: monthlySummary,
    );

    return _achievementsRepository.saveAchievements(achievements);
  }
}
