import 'analytics_event.dart';

abstract interface class AnalyticsTracker {
  Future<void> track(AnalyticsEvent event);
}
