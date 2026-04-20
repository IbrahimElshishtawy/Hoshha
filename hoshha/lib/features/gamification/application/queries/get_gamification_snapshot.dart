import '../../../../core/async/combine_latest.dart';
import '../models/gamification_snapshot.dart';
import '../services/achievement_projector.dart';
import '../services/streak_projector.dart';
import '../services/user_stats_projector.dart';
import '../../domain/achievement_progress.dart';
import '../../domain/achievements_repository.dart';
import '../../domain/streak.dart';
import '../../domain/streak_repository.dart';
import '../../domain/user_stats.dart';
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
    return _buildSnapshot(
      now: now,
      stats: await _userStatsRepository.getUserStats(),
      streak: await _streakRepository.getStreak(StreakType.expenseLogging),
      achievements: await _achievementsRepository.getAchievements(),
    );
  }

  Stream<GamificationSnapshot> watch() {
    return combineLatest3(
      _userStatsRepository.watchUserStats(),
      _streakRepository.watchStreak(StreakType.expenseLogging),
      _achievementsRepository.watchAchievements(),
      (stats, streak, achievements) => _buildSnapshot(
        now: _now(),
        stats: stats,
        streak: streak,
        achievements: achievements,
      ),
    );
  }

  GamificationSnapshot _buildSnapshot({
    required DateTime now,
    required UserStats? stats,
    required Streak? streak,
    required List<AchievementProgress> achievements,
  }) {
    final resolvedStats = stats ?? _userStatsProjector.initial(now);
    final resolvedStreak = streak ?? _streakProjector.initial(now);
    final resolvedAchievements = _achievementProjector.seed(now, achievements);
    final unlockedAchievementsCount = resolvedAchievements
        .where((achievement) => achievement.isUnlocked)
        .length;

    return GamificationSnapshot(
      totalXp: resolvedStats.totalXp,
      currentLevel: resolvedStats.level,
      currentStreak: resolvedStreak.currentCount,
      bestStreak: resolvedStreak.bestCount,
      unlockedAchievementsCount: unlockedAchievementsCount,
      nextLevelProgress: _nextLevelProgress(resolvedStats.totalXp),
    );
  }

  double _nextLevelProgress(int totalXp) {
    if (totalXp <= 0) {
      return 0.0;
    }
    return (totalXp % 100) / 100;
  }
}
