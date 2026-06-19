class AnalyticsEvent {
  const AnalyticsEvent(this.name, [this.parameters]);

  final String name;
  final Map<String, Object?>? parameters;
}
