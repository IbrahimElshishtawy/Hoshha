import '../../../budgets/domain/budget.dart';
import '../../../gamification/domain/achievement_progress.dart';
import '../../../gamification/domain/streak.dart';
import '../../../gamification/domain/user_stats.dart';
import '../../domain/expense.dart';

class RecordExpenseResult {
  const RecordExpenseResult({
    required this.expense,
    required this.stats,
    required this.streak,
    required this.achievements,
    this.budget,
  });

  final Expense expense;
  final UserStats stats;
  final Streak streak;
  final List<AchievementProgress> achievements;
  final Budget? budget;

  List<AchievementProgress> get newlyUnlockedAchievements {
    return achievements
        .where((achievement) => achievement.isUnlocked)
        .toList(growable: false);
  }
}
