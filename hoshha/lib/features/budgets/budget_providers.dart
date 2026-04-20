import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/in_memory_budget_repository.dart';
import 'domain/budget_repository.dart';

final budgetRepositoryProvider = Provider<BudgetRepository>(
  (ref) => InMemoryBudgetRepository(),
  name: 'budgetRepositoryProvider',
);
