import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/expenses/presentation/screens/add_expense_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

abstract final class AppRoutes {
  static const dashboard = '/';
  static const addExpense = '/expenses/add';
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
        path: AppRoutes.addExpense,
        builder: (context, state) => const AddExpenseScreen(),
      ),
    ],
  ),
  name: 'appRouterProvider',
);
