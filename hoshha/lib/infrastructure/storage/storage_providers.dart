import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/settings/app_settings_repository.dart';
import 'local_app_settings_repository.dart';
import 'shared_preferences_app_settings_data_source.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(
    'sharedPreferencesProvider must be overridden during bootstrap.',
  ),
  name: 'sharedPreferencesProvider',
);

final appSettingsLocalDataSourceProvider = Provider<AppSettingsLocalDataSource>(
  (ref) => SharedPreferencesAppSettingsDataSource(
    ref.watch(sharedPreferencesProvider),
  ),
  name: 'appSettingsLocalDataSourceProvider',
);

final appSettingsRepositoryProvider = Provider<AppSettingsRepository>(
  (ref) =>
      LocalAppSettingsRepository(ref.watch(appSettingsLocalDataSourceProvider)),
  name: 'appSettingsRepositoryProvider',
);
