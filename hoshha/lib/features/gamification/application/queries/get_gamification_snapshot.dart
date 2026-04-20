import '../models/gamification_snapshot.dart';
import '../services/achievement_projector.dart';
import '../services/streak_projector.dart';
import '../services/user_stats_projector.dart';
import '../../domain/achievements_repository.dart';
import '../../domain/streak.dart';
import '../../domain/streak_repository.dart';
import '../../domain/user_stats_repository.dart';

class GetGamificationSnapshot {
  const GetGamificationSnapshot({
    required UserStatsRepository userStatsRepository,
    required StreakRepository streakRepository,
    required AchievementsRepository achievementsRepository,
    required UserStatsProjector userStatsProjector,
    required StreakProjector streakProjector,
    required AchievementProjector achievementProjector,
    required DateTime Function() now,
  }) : _userStatsRepository = userStatsRepository,
       _streakRepository = streakRepository,
       _achievementsRepository = achievementsRepository,
       _userStatsProjector = userStatsProjector,
       _streakProjector = streakProjector,
       _achievementProjector = achievementProjector,
       _now = now;

  final UserStatsRepository _userStatsRepository;
  final StreakRepository _streakRepository;
  final AchievementsRepository _achievementsRepository;
  final UserStatsProjector _userStatsProjector;
  final StreakProjector _streakProjector;
  final AchievementProjector _achievementProjector;
  final DateTime Function() _now;

  Future<GamificationSnapshot> call() async {
    final now = _now();
    final stats =
        await _userStatsRepository.getUserStats() ?? _userStatsProjector.initial(now);
    final streak = await _streakRepository.getStreak(StreakType.expenseLogging) ??
        _streakProjector.initial(now);
    final achievements = _achievementProjector.seed(
      now,
      await _achievementsRepository.getAchievements(),
    );

    return GamificationSnapshot(
      stats: stats,
      streak: streak,
      achievements: achievements,
    );
  }
}
