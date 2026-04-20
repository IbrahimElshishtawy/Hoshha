class AppFeatureFlags {
  const AppFeatureFlags({
    required this.authEnabled,
    required this.premiumEnabled,
    required this.inAppUpdatesEnabled,
    required this.remoteSyncEnabled,
  });

  final bool authEnabled;
  final bool premiumEnabled;
  final bool inAppUpdatesEnabled;
  final bool remoteSyncEnabled;

  const AppFeatureFlags.defaults()
    : this(
        authEnabled: false,
        premiumEnabled: false,
        inAppUpdatesEnabled: false,
        remoteSyncEnabled: false,
      );
}
