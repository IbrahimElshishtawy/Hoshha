import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_providers.dart';
import '../expenses/expenses_providers.dart';
import '../gamification/gamification_providers.dart';
import 'application/dashboard_controller.dart';
import 'application/load_dashboard_snapshot.dart';
import 'domain/dashboard_snapshot.dart';

final getDashboardSnapshotProvider = Provider<GetDashboardSnapshot>(
  (ref) => GetDashboardSnapshot(
    getMonthlySummary: ref.watch(getMonthlySummaryProvider),
    getGamificationSnapshot: ref.watch(getGamificationSnapshotProvider),
    now: ref.watch(clockProvider).now,
  ),
  name: 'getDashboardSnapshotProvider',
);

final dashboardSnapshotProvider = FutureProvider<DashboardSnapshot>(
  (ref) => ref.watch(getDashboardSnapshotProvider).call(),
  name: 'dashboardSnapshotProvider',
);

final dashboardControllerProvider =
    AsyncNotifierProvider<DashboardController, DashboardSnapshot>(
      DashboardController.new,
      name: 'dashboardControllerProvider',
    );
