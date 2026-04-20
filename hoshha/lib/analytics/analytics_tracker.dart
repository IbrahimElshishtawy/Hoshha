import 'analytics_event.dart';

abstract class AnalyticsTracker {
  Future<void> track(AnalyticsEvent event);
}
