import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../analytics/analytics_tracker.dart';
import '../core/config/app_environment.dart';
import '../core/config/app_feature_flags.dart';
import '../core/logging/app_logger.dart';
import '../core/time/clock.dart';
import 'telemetry/console_analytics_tracker.dart';

final appEnvironmentProvider = Provider<AppEnvironment>(
  (ref) => const AppEnvironment.development(),
  name: 'appEnvironmentProvider',
);

final appFeatureFlagsProvider = Provider<AppFeatureFlags>(
  (ref) => const AppFeatureFlags(
    authEnabled: false,
    premiumEnabled: false,
    inAppUpdatesEnabled: false,
    remoteSyncEnabled: false,
  ),
  name: 'appFeatureFlagsProvider',
);

final clockProvider = Provider<Clock>(
  (ref) => const SystemClock(),
  name: 'clockProvider',
);

final appLoggerProvider = Provider<AppLogger>(
  (ref) => DebugAppLogger(),
  name: 'appLoggerProvider',
);

final analyticsTrackerProvider = Provider<AnalyticsTracker>(
  (ref) => ConsoleAnalyticsTracker(ref.watch(appLoggerProvider)),
  name: 'analyticsTrackerProvider',
);
