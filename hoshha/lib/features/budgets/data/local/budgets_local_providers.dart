import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_db/isar_db.dart';

import '../../../../infrastructure/database/database_providers.dart';
import 'budget_record.dart';
import 'budgets_local_data_source.dart';

final budgetCollectionProvider = Provider<IsarCollection<int, BudgetRecord>>(
  (ref) => ref.watch(isarProvider).budgetRecords,
  name: 'budgetCollectionProvider',
);

final budgetsLocalDataSourceProvider = Provider<BudgetsLocalDataSource>(
  (ref) => BudgetsLocalDataSource(ref.watch(isarProvider)),
  name: 'budgetsLocalDataSourceProvider',
);
