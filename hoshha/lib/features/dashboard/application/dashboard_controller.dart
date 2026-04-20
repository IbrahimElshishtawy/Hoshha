import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_providers.dart';
import '../../../analytics/analytics_event.dart';
import '../dashboard_providers.dart';
import '../domain/dashboard_snapshot.dart';

class DashboardController extends AsyncNotifier<DashboardSnapshot> {
  @override
  Future<DashboardSnapshot> build() async {
    await ref
        .watch(analyticsTrackerProvider)
        .track(const AnalyticsEvent(name: 'dashboard_opened'));

    return ref.watch(getDashboardSnapshotProvider).call();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(getDashboardSnapshotProvider).call(),
    );
  }
}
