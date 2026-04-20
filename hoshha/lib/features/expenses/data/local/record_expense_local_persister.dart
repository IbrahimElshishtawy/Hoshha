import '../../../budgets/data/local/budget_mapper.dart';
import '../../../budgets/data/local/budgets_local_data_source.dart';
import '../../../budgets/domain/budget.dart';
import '../../../gamification/data/local/achievement_progress_mapper.dart';
import '../../../gamification/data/local/achievements_local_data_source.dart';
import '../../../gamification/data/local/stats_local_data_source.dart';
import '../../../gamification/data/local/streak_mapper.dart';
import '../../../gamification/data/local/streaks_local_data_source.dart';
import '../../../gamification/data/local/user_stats_mapper.dart';
import '../../../gamification/domain/achievement_progress.dart';
import '../../../gamification/domain/streak.dart';
import '../../../gamification/domain/user_stats.dart';
import '../../../../infrastructure/database/app_database_writer.dart';
import '../../domain/expense.dart';
import 'expense_mapper.dart';
import 'expenses_local_data_source.dart';

class RecordExpenseLocalPersister {
  RecordExpenseLocalPersister({
    required AppDatabaseWriter databaseWriter,
    required ExpensesLocalDataSource expensesLocalDataSource,
    required StatsLocalDataSource statsLocalDataSource,
    required StreaksLocalDataSource streaksLocalDataSource,
    required AchievementsLocalDataSource achievementsLocalDataSource,
    required BudgetsLocalDataSource budgetsLocalDataSource,
  }) : _databaseWriter = databaseWriter,
       _expensesLocalDataSource = expensesLocalDataSource,
       _statsLocalDataSource = statsLocalDataSource,
       _streaksLocalDataSource = streaksLocalDataSource,
       _achievementsLocalDataSource = achievementsLocalDataSource,
       _budgetsLocalDataSource = budgetsLocalDataSource;

  final AppDatabaseWriter _databaseWriter;
  final ExpensesLocalDataSource _expensesLocalDataSource;
  final StatsLocalDataSource _statsLocalDataSource;
  final StreaksLocalDataSource _streaksLocalDataSource;
  final AchievementsLocalDataSource _achievementsLocalDataSource;
  final BudgetsLocalDataSource _budgetsLocalDataSource;

  Future<void> persist({
    required Expense expense,
    required UserStats stats,
    required Streak streak,
    required List<AchievementProgress> achievements,
    Budget? budget,
  }) async {
    final currentExpense = await _expensesLocalDataSource.findByEntityId(expense.id);
    final currentStats = await _statsLocalDataSource.getStats();
    final currentStreak = await _streaksLocalDataSource.findByType(streak.type.name);
    final currentAchievements = await _achievementsLocalDataSource.getAll();
    final currentAchievementsById = {
      for (final achievement in currentAchievements) achievement.achievementId: achievement,
    };
    final currentBudget = budget == null
        ? null
        : await _budgetsLocalDataSource.findByMonthKey(budget.monthKey);

    final expenseRecord = mapExpenseToRecord(expense, current: currentExpense);
    final statsRecord = mapUserStatsToRecord(stats, current: currentStats);
    final streakRecord = mapStreakToRecord(streak, current: currentStreak);
    final achievementRecords = achievements
        .map(
          (achievement) => mapAchievementProgressToRecord(
            achievement,
            current: currentAchievementsById[achievement.achievementId.name],
          ),
        )
        .toList(growable: false);
    final budgetRecord = budget == null
        ? null
        : mapBudgetToRecord(budget, current: currentBudget);

    await _databaseWriter.write((isar) {
      _expensesLocalDataSource.putRecordInTransaction(isar, expenseRecord);
      _statsLocalDataSource.putRecordInTransaction(isar, statsRecord);
      _streaksLocalDataSource.putRecordInTransaction(isar, streakRecord);
      for (final achievementRecord in achievementRecords) {
        _achievementsLocalDataSource.putRecordInTransaction(
          isar,
          achievementRecord,
        );
      }
      if (budgetRecord != null) {
        _budgetsLocalDataSource.putRecordInTransaction(isar, budgetRecord);
      }
    });
  }
}
