import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'package:hoshha/localization/app_locale_preference.dart';
import 'package:hoshha/localization/localization_providers.dart';
import 'package:hoshha/theme/app_theme_preference.dart';
import 'package:hoshha/theme/theme_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePreference = ref.watch(themeControllerProvider).value ?? const AppThemePreference.defaults();
    final localePreference = ref.watch(localeControllerProvider).value ?? AppLocalePreference.arabic;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Language / اللغة', style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: const Icon(Icons.language),
                ),
                RadioListTile<AppLocalePreference>(
                  title: const Text('العربية'),
                  value: AppLocalePreference.arabic,
                  groupValue: localePreference,
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(localeControllerProvider.notifier).updateLocale(val);
                    }
                  },
                ),
                RadioListTile<AppLocalePreference>(
                  title: const Text('English'),
                  value: AppLocalePreference.english,
                  groupValue: localePreference,
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(localeControllerProvider.notifier).updateLocale(val);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                const ListTile(
                  title: Text('Theme Family / لون السمة', style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.palette),
                ),
                RadioListTile<AppThemeFamily>(
                  title: const Text('Jade (Teal)'),
                  value: AppThemeFamily.jade,
                  groupValue: themePreference.family,
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(themeControllerProvider.notifier).updateFamily(val);
                    }
                  },
                ),
                RadioListTile<AppThemeFamily>(
                  title: const Text('Sunset (Orange)'),
                  value: AppThemeFamily.sunset,
                  groupValue: themePreference.family,
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(themeControllerProvider.notifier).updateFamily(val);
                    }
                  },
                ),
                RadioListTile<AppThemeFamily>(
                  title: const Text('Onyx (Emerald)'),
                  value: AppThemeFamily.onyx,
                  groupValue: themePreference.family,
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(themeControllerProvider.notifier).updateFamily(val);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                const ListTile(
                  title: Text('Theme Mode / وضع المظهر', style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.brightness_medium),
                ),
                RadioListTile<AppThemeModePreference>(
                  title: const Text('Light / فاتح'),
                  value: AppThemeModePreference.light,
                  groupValue: themePreference.mode,
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(themeControllerProvider.notifier).updateMode(val);
                    }
                  },
                ),
                RadioListTile<AppThemeModePreference>(
                  title: const Text('Dark / داكن'),
                  value: AppThemeModePreference.dark,
                  groupValue: themePreference.mode,
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(themeControllerProvider.notifier).updateMode(val);
                    }
                  },
                ),
                RadioListTile<AppThemeModePreference>(
                  title: const Text('System / النظام'),
                  value: AppThemeModePreference.system,
                  groupValue: themePreference.mode,
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(themeControllerProvider.notifier).updateMode(val);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
