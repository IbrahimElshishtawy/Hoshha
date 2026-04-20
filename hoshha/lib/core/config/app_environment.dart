enum Environment { development, staging, production }

class AppEnvironment {
  const AppEnvironment({
    required this.appName,
    required this.environment,
    required this.analyticsEnabled,
    required this.crashReportingEnabled,
  });

  const AppEnvironment.development()
    : this(
        appName: 'حوشها',
        environment: Environment.development,
        analyticsEnabled: true,
        crashReportingEnabled: false,
      );

  final String appName;
  final Environment environment;
  final bool analyticsEnabled;
  final bool crashReportingEnabled;

  bool get isProduction => environment == Environment.production;
}
