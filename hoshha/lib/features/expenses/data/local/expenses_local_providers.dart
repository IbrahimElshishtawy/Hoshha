import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../infrastructure/database/database_providers.dart';
import 'expense_record.dart';
import 'expenses_local_data_source.dart';

final expenseCollectionProvider = Provider<IsarCollection<int, ExpenseRecord>>(
  (ref) => ref.watch(isarProvider).expenseRecords,
  name: 'expenseCollectionProvider',
);

final expensesLocalDataSourceProvider = Provider<ExpensesLocalDataSource>(
  (ref) => ExpensesLocalDataSource(ref.watch(isarProvider)),
  name: 'expensesLocalDataSourceProvider',
);
