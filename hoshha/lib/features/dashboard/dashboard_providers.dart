import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/providers.dart';
import '../budgets/budget_providers.dart';
import '../expenses/expenses_providers.dart';
import '../gamification/gamification_providers.dart';
import 'application/dashboard_controller.dart';
import 'application/load_dashboard_snapshot.dart';
import 'domain/dashboard_snapshot.dart';

final loadDashboardSnapshotProvider = Provider<LoadDashboardSnapshot>(
  (ref) => LoadDashboardSnapshot(
    expenseRepository: ref.watch(expenseRepositoryProvider),
    budgetRepository: ref.watch(budgetRepositoryProvider),
    progressRepository: ref.watch(progressRepositoryProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'loadDashboardSnapshotProvider',
);

final dashboardControllerProvider =
    AsyncNotifierProvider<DashboardController, DashboardSnapshot>(
      DashboardController.new,
      name: 'dashboardControllerProvider',
    );
