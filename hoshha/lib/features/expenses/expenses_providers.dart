import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_providers.dart';
import 'data/in_memory_expense_repository.dart';
import 'domain/expense_repository.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>(
  (ref) => InMemoryExpenseRepository(ref.watch(clockProvider)),
  name: 'expenseRepositoryProvider',
);
