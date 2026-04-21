import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/database/database_providers.dart';
import '../budgets/data/local/budgets_local_providers.dart';
import '../expenses/data/local/expenses_local_providers.dart';
import '../gamification/data/local/gamification_local_providers.dart';
import 'application/commands/reset_app_data.dart';
import 'data/local/reset_app_data_local_persister.dart';

final resetAppDataLocalPersisterProvider = Provider<ResetAppDataLocalPersister>(
  (ref) => ResetAppDataLocalPersister(
    databaseWriter: ref.watch(appDatabaseWriterProvider),
    expensesLocalDataSource: ref.watch(expensesLocalDataSourceProvider),
    budgetsLocalDataSource: ref.watch(budgetsLocalDataSourceProvider),
    statsLocalDataSource: ref.watch(statsLocalDataSourceProvider),
    streaksLocalDataSource: ref.watch(streaksLocalDataSourceProvider),
    achievementsLocalDataSource: ref.watch(achievementsLocalDataSourceProvider),
  ),
  name: 'resetAppDataLocalPersisterProvider',
);

final resetAppDataProvider = Provider<ResetAppData>(
  (ref) => ResetAppData(ref.watch(resetAppDataLocalPersisterProvider)),
  name: 'resetAppDataProvider',
);
