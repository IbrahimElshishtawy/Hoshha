import '../../analytics/analytics_event.dart';
import '../../analytics/analytics_tracker.dart';
import '../../core/logging/app_logger.dart';

class ConsoleAnalyticsTracker implements AnalyticsTracker {
  ConsoleAnalyticsTracker(this._logger);

  final AppLogger _logger;

  @override
  Future<void> track(AnalyticsEvent event) async {
    _logger.info('Analytics event: ${event.name} ${event.parameters}');
  }
}
