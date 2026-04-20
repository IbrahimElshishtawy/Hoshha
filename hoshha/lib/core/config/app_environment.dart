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

  const AppEnvironment.staging()
    : this(
        appName: 'حوشها - Staging',
        environment: Environment.staging,
        analyticsEnabled: true,
        crashReportingEnabled: false,
      );

  const AppEnvironment.production()
    : this(
        appName: 'حوشها',
        environment: Environment.production,
        analyticsEnabled: true,
        crashReportingEnabled: true,
      );

  final String appName;
  final Environment environment;
  final bool analyticsEnabled;
  final bool crashReportingEnabled;

  bool get isProduction => environment == Environment.production;

  static AppEnvironment fromBuild() {
    const environmentName = String.fromEnvironment(
      'APP_ENV',
      defaultValue: 'development',
    );

    return switch (environmentName) {
      'production' => const AppEnvironment.production(),
      'staging' => const AppEnvironment.staging(),
      _ => const AppEnvironment.development(),
    };
  }
}
