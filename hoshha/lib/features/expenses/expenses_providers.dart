import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_providers.dart';
import '../../infrastructure/database/database_providers.dart';
import '../budgets/budget_providers.dart';
import '../budgets/data/local/budgets_local_providers.dart';
import '../gamification/gamification_providers.dart';
import '../gamification/data/local/gamification_local_providers.dart';
import 'application/commands/delete_expense.dart';
import 'application/commands/record_expense.dart';
import 'application/commands/update_expense.dart';
import 'application/models/expense_query.dart';
import 'application/models/record_expense_result.dart';
import 'application/queries/get_expenses.dart';
import 'application/queries/get_expenses_by_date_range.dart';
import 'application/queries/get_monthly_summary.dart';
import 'application/queries/get_recent_expenses.dart';
import 'application/record_expense_controller.dart';
import 'data/local/expenses_local_providers.dart';
import 'data/local/record_expense_local_persister.dart';
import 'data/repositories/local_expenses_repository.dart';
import 'domain/expense.dart';
import 'domain/expense_repository.dart';

final expensesRepositoryProvider = Provider<ExpensesRepository>(
  (ref) => LocalExpensesRepository(ref.watch(expensesLocalDataSourceProvider)),
  name: 'expensesRepositoryProvider',
);

final getExpensesProvider = Provider<GetExpenses>(
  (ref) => GetExpenses(ref.watch(expensesRepositoryProvider)),
  name: 'getExpensesProvider',
);

final getExpensesByDateRangeProvider = Provider<GetExpensesByDateRange>(
  (ref) => GetExpensesByDateRange(ref.watch(expensesRepositoryProvider)),
  name: 'getExpensesByDateRangeProvider',
);

final getRecentExpensesProvider = Provider<GetRecentExpenses>(
  (ref) => GetRecentExpenses(ref.watch(expensesRepositoryProvider)),
  name: 'getRecentExpensesProvider',
);

final getMonthlySummaryProvider = Provider<GetMonthlySummary>(
  (ref) => GetMonthlySummary(
    expensesRepository: ref.watch(expensesRepositoryProvider),
    budgetRepository: ref.watch(budgetRepositoryProvider),
  ),
  name: 'getMonthlySummaryProvider',
);

final recordExpenseLocalPersisterProvider = Provider<RecordExpenseLocalPersister>(
  (ref) => RecordExpenseLocalPersister(
    databaseWriter: ref.watch(appDatabaseWriterProvider),
    expensesLocalDataSource: ref.watch(expensesLocalDataSourceProvider),
    statsLocalDataSource: ref.watch(statsLocalDataSourceProvider),
    streaksLocalDataSource: ref.watch(streaksLocalDataSourceProvider),
    achievementsLocalDataSource: ref.watch(achievementsLocalDataSourceProvider),
    budgetsLocalDataSource: ref.watch(budgetsLocalDataSourceProvider),
  ),
  name: 'recordExpenseLocalPersisterProvider',
);

final recordExpenseProvider = Provider<RecordExpense>(
  (ref) => RecordExpense(
    budgetRepository: ref.watch(budgetRepositoryProvider),
    userStatsRepository: ref.watch(userStatsRepositoryProvider),
    streakRepository: ref.watch(streakRepositoryProvider),
    achievementsRepository: ref.watch(achievementsRepositoryProvider),
    userStatsProjector: ref.watch(userStatsProjectorProvider),
    streakProjector: ref.watch(streakProjectorProvider),
    achievementProjector: ref.watch(achievementProjectorProvider),
    persister: ref.watch(recordExpenseLocalPersisterProvider),
    getMonthlySummary: ref.watch(getMonthlySummaryProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'recordExpenseProvider',
);

final updateExpenseProvider = Provider<UpdateExpense>(
  (ref) => UpdateExpense(
    expensesRepository: ref.watch(expensesRepositoryProvider),
    refreshUserStats: ref.watch(refreshUserStatsProvider),
    refreshStreak: ref.watch(refreshStreakProvider),
    evaluateAchievements: ref.watch(evaluateAchievementsProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'updateExpenseProvider',
);

final deleteExpenseProvider = Provider<DeleteExpense>(
  (ref) => DeleteExpense(
    expensesRepository: ref.watch(expensesRepositoryProvider),
    refreshUserStats: ref.watch(refreshUserStatsProvider),
    refreshStreak: ref.watch(refreshStreakProvider),
    evaluateAchievements: ref.watch(evaluateAchievementsProvider),
  ),
  name: 'deleteExpenseProvider',
);

final recentExpensesProvider = FutureProvider<List<Expense>>(
  (ref) => ref.watch(getRecentExpensesProvider).call(),
  name: 'recentExpensesProvider',
);

final expensesQueryProvider = FutureProvider.family<List<Expense>, ExpenseQuery>(
  (ref, query) => ref.watch(getExpensesProvider).call(query),
  name: 'expensesQueryProvider',
);

final currentMonthSummaryProvider = FutureProvider(
  (ref) => ref.watch(getMonthlySummaryProvider).call(ref.watch(clockProvider).now()),
  name: 'currentMonthSummaryProvider',
);

final recordExpenseControllerProvider =
    AsyncNotifierProvider<RecordExpenseController, RecordExpenseResult?>(
      RecordExpenseController.new,
      name: 'recordExpenseControllerProvider',
    );
