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
import 'application/models/budget_status.dart';
import 'application/models/budget_status_thresholds.dart';
import 'application/models/expense_query.dart';
import 'application/models/monthly_summary.dart';
import 'application/models/record_expense_result.dart';
import 'application/queries/get_expenses.dart';
import 'application/queries/get_monthly_summary.dart';
import 'application/record_expense_controller.dart';
import 'application/services/budget_status_calculator.dart';
import 'application/services/expense_aggregator.dart';
import 'application/services/expense_grouping.dart';
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

final expenseGroupingProvider = Provider<ExpenseGrouping>(
  (ref) => const ExpenseGrouping(),
  name: 'expenseGroupingProvider',
);

final expenseAggregatorProvider = Provider<ExpenseAggregator>(
  (ref) => const ExpenseAggregator(),
  name: 'expenseAggregatorProvider',
);

final budgetStatusThresholdsProvider = Provider<BudgetStatusThresholds>(
  (ref) => BudgetStatusThresholds.v1,
  name: 'budgetStatusThresholdsProvider',
);

final budgetStatusCalculatorProvider = Provider<BudgetStatusCalculator>(
  (ref) => BudgetStatusCalculator(
    thresholds: ref.watch(budgetStatusThresholdsProvider),
  ),
  name: 'budgetStatusCalculatorProvider',
);

final getMonthlySummaryProvider = Provider<GetMonthlySummary>(
  (ref) => GetMonthlySummary(
    expensesRepository: ref.watch(expensesRepositoryProvider),
    budgetRepository: ref.watch(budgetRepositoryProvider),
    expenseAggregator: ref.watch(expenseAggregatorProvider),
  ),
  name: 'getMonthlySummaryProvider',
);

final recordExpenseLocalPersisterProvider =
    Provider<RecordExpenseLocalPersister>(
      (ref) => RecordExpenseLocalPersister(
        databaseWriter: ref.watch(appDatabaseWriterProvider),
        expensesLocalDataSource: ref.watch(expensesLocalDataSourceProvider),
        statsLocalDataSource: ref.watch(statsLocalDataSourceProvider),
        streaksLocalDataSource: ref.watch(streaksLocalDataSourceProvider),
        achievementsLocalDataSource: ref.watch(
          achievementsLocalDataSourceProvider,
        ),
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

final recentExpensesProvider = StreamProvider<List<Expense>>(
  (ref) => ref.watch(getExpensesProvider).watch(const ExpenseQuery.recent()),
  name: 'recentExpensesProvider',
);

final expenseHistoryProvider =
    StreamProvider.family<List<Expense>, ExpenseQuery>(
      (ref, query) => ref.watch(getExpensesProvider).watch(query),
      name: 'expenseHistoryProvider',
    );

final expensesQueryProvider = expenseHistoryProvider;

final monthlySummaryProvider = StreamProvider<MonthlySummary>(
  (ref) => ref
      .watch(getMonthlySummaryProvider)
      .watch(ref.watch(clockProvider).now()),
  name: 'monthlySummaryProvider',
);

final currentMonthSummaryProvider = monthlySummaryProvider;

final budgetStatusProvider = StreamProvider<BudgetStatus>(
  (ref) => ref
      .watch(getMonthlySummaryProvider)
      .watch(ref.watch(clockProvider).now())
      .map(ref.watch(budgetStatusCalculatorProvider).call),
  name: 'budgetStatusProvider',
);

final recordExpenseControllerProvider =
    AsyncNotifierProvider<RecordExpenseController, RecordExpenseResult?>(
      RecordExpenseController.new,
      name: 'recordExpenseControllerProvider',
    );
