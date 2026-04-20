import 'achievement_progress.dart';

abstract class AchievementsRepository {
  Future<AchievementProgress?> getAchievement(AchievementId achievementId);

  Future<List<AchievementProgress>> getAchievements();

  Stream<List<AchievementProgress>> watchAchievements();

  Future<AchievementProgress> saveAchievement(AchievementProgress achievement);

  Future<List<AchievementProgress>> saveAchievements(
    List<AchievementProgress> achievements,
  );
}
