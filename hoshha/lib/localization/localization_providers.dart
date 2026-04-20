import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/bootstrap/app_bootstrap_controller.dart';
import '../infrastructure/storage/storage_providers.dart';
import 'app_locale_preference.dart';

class LocaleController extends AsyncNotifier<AppLocalePreference> {
  @override
  Future<AppLocalePreference> build() async {
    final bootstrap = await ref.watch(appBootstrapControllerProvider.future);
    return bootstrap.settings.localePreference;
  }

  Future<void> updateLocale(AppLocalePreference preference) async {
    final previous = state.asData?.value;
    state = AsyncData(preference);

    try {
      await ref
          .read(appSettingsRepositoryProvider)
          .saveLocalePreference(preference);
    } catch (error, stackTrace) {
      if (previous != null) {
        state = AsyncData(previous);
      } else {
        state = AsyncError(error, stackTrace);
      }
      rethrow;
    }
  }
}

final localeControllerProvider =
    AsyncNotifierProvider<LocaleController, AppLocalePreference>(
      LocaleController.new,
      name: 'localeControllerProvider',
    );

final currentLocaleProvider = Provider<Locale?>((ref) {
  final preference =
      ref.watch(localeControllerProvider).asData?.value ??
      AppLocalePreference.arabic;
  return preference.locale;
}, name: 'currentLocaleProvider');
