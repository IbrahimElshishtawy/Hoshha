class GamificationSnapshot {
  const GamificationSnapshot({
    required this.totalXp,
    required this.currentLevel,
    required this.currentStreak,
    required this.bestStreak,
    required this.unlockedAchievementsCount,
    required this.nextLevelProgress,
  });

  const GamificationSnapshot.empty()
    : totalXp = 0,
      currentLevel = 1,
      currentStreak = 0,
      bestStreak = 0,
      unlockedAchievementsCount = 0,
      nextLevelProgress = 0.0;

  final int totalXp;
  final int currentLevel;
  final int currentStreak;
  final int bestStreak;
  final int unlockedAchievementsCount;
  final double nextLevelProgress;
}
