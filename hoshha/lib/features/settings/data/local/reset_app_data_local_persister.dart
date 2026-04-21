import '../../../../infrastructure/database/app_database_writer.dart';
import '../../../budgets/data/local/budgets_local_data_source.dart';
import '../../../expenses/data/local/expenses_local_data_source.dart';
import '../../../gamification/data/local/achievements_local_data_source.dart';
import '../../../gamification/data/local/stats_local_data_source.dart';
import '../../../gamification/data/local/streaks_local_data_source.dart';

class ResetAppDataLocalPersister {
  ResetAppDataLocalPersister({
    required AppDatabaseWriter databaseWriter,
    required ExpensesLocalDataSource expensesLocalDataSource,
    required BudgetsLocalDataSource budgetsLocalDataSource,
    required StatsLocalDataSource statsLocalDataSource,
    required StreaksLocalDataSource streaksLocalDataSource,
    required AchievementsLocalDataSource achievementsLocalDataSource,
  }) : _databaseWriter = databaseWriter,
       _expensesLocalDataSource = expensesLocalDataSource,
       _budgetsLocalDataSource = budgetsLocalDataSource,
       _statsLocalDataSource = statsLocalDataSource,
       _streaksLocalDataSource = streaksLocalDataSource,
       _achievementsLocalDataSource = achievementsLocalDataSource;

  final AppDatabaseWriter _databaseWriter;
  final ExpensesLocalDataSource _expensesLocalDataSource;
  final BudgetsLocalDataSource _budgetsLocalDataSource;
  final StatsLocalDataSource _statsLocalDataSource;
  final StreaksLocalDataSource _streaksLocalDataSource;
  final AchievementsLocalDataSource _achievementsLocalDataSource;

  Future<void> clearAll() {
    return _databaseWriter.write((isar) {
      _expensesLocalDataSource.clearInTransaction(isar);
      _budgetsLocalDataSource.clearInTransaction(isar);
      _statsLocalDataSource.clearInTransaction(isar);
      _streaksLocalDataSource.clearInTransaction(isar);
      _achievementsLocalDataSource.clearInTransaction(isar);
    });
  }
}
