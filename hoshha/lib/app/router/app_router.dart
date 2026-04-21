import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/budget/presentation/screens/budget_screen.dart';
import '../../features/expenses/presentation/screens/add_expense_screen.dart';
import '../../features/history/presentation/screens/history_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/insights/presentation/screens/insights_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';

abstract final class AppRoutes {
  static const dashboard = '/';
  static const budget = '/budget';
  static const history = '/history';
  static const insights = '/insights';
  static const addExpense = '/expenses/add';
  static const settings = '/settings';
}

final appRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: AppRoutes.dashboard,
    routes: [
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.budget,
        builder: (context, state) => const BudgetScreen(),
      ),
      GoRoute(
        path: AppRoutes.history,
        builder: (context, state) => const HistoryScreen(),
      ),
      GoRoute(
        path: AppRoutes.insights,
        builder: (context, state) => const InsightsScreen(),
      ),
      GoRoute(
        path: AppRoutes.addExpense,
        builder: (context, state) => const AddExpenseScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  ),
  name: 'appRouterProvider',
);
