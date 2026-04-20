enum AchievementId {
  firstExpense,
  fiveExpenses,
  firstBudgetSet,
  sevenDayExpenseStreak,
  underBudgetMonth,
}

class AchievementProgress {
  const AchievementProgress({
    required this.achievementId,
    required this.progress,
    required this.isUnlocked,
    required this.createdAt,
    required this.updatedAt,
    this.unlockedAt,
  });

  final AchievementId achievementId;
  final int progress;
  final bool isUnlocked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? unlockedAt;
}
