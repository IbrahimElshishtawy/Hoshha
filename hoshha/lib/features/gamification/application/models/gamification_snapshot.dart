import '../../domain/achievement_progress.dart';
import '../../domain/streak.dart';
import '../../domain/user_stats.dart';

class GamificationSnapshot {
  const GamificationSnapshot({
    required this.stats,
    required this.streak,
    required this.achievements,
  });

  final UserStats stats;
  final Streak streak;
  final List<AchievementProgress> achievements;

  int get unlockedAchievementsCount =>
      achievements.where((achievement) => achievement.isUnlocked).length;
}
