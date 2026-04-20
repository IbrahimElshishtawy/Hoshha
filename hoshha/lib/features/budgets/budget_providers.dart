import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_providers.dart';
import '../gamification/gamification_providers.dart';
import 'application/commands/set_monthly_budget.dart';
import 'application/queries/get_current_budget.dart';
import 'data/local/budgets_local_providers.dart';
import 'data/repositories/local_budget_repository.dart';
import 'domain/budget_repository.dart';
import 'domain/monthly_budget.dart';

final budgetRepositoryProvider = Provider<BudgetRepository>(
  (ref) => LocalBudgetRepository(ref.watch(budgetsLocalDataSourceProvider)),
  name: 'budgetRepositoryProvider',
);

final getCurrentBudgetProvider = Provider<GetCurrentBudget>(
  (ref) => GetCurrentBudget(ref.watch(budgetRepositoryProvider)),
  name: 'getCurrentBudgetProvider',
);

final setMonthlyBudgetProvider = Provider<SetMonthlyBudget>(
  (ref) => SetMonthlyBudget(
    budgetRepository: ref.watch(budgetRepositoryProvider),
    evaluateAchievements: ref.watch(evaluateAchievementsProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'setMonthlyBudgetProvider',
);

final currentBudgetProvider = FutureProvider<MonthlyBudget?>(
  (ref) => ref.watch(getCurrentBudgetProvider).call(ref.watch(clockProvider).now()),
  name: 'currentBudgetProvider',
);
