import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../localization/app_locale_preference.dart';
import '../../../../localization/localization_providers.dart';
import '../settings_copy.dart';
import 'settings_section.dart';
import 'settings_tile.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copy = SettingsCopy.of(context);
    final preference =
        ref.watch(localeControllerProvider).asData?.value ??
        AppLocalePreference.arabic;
    final currentLanguageCode = Localizations.localeOf(context).languageCode;

    return SettingsSection(
      title: copy.languageSectionTitle,
      children: [
        SettingsTile(
          title: copy.languageArabic,
          subtitle: _subtitleFor(
            copy: copy,
            option: AppLocalePreference.arabic,
            current: preference,
            currentLanguageCode: currentLanguageCode,
          ),
          icon: Icons.language_rounded,
          selected: _isSelected(
            option: AppLocalePreference.arabic,
            current: preference,
            currentLanguageCode: currentLanguageCode,
          ),
          onTap: () =>
              _updateLocale(context, ref, AppLocalePreference.arabic, copy),
        ),
        SettingsTile(
          title: copy.languageEnglish,
          subtitle: _subtitleFor(
            copy: copy,
            option: AppLocalePreference.english,
            current: preference,
            currentLanguageCode: currentLanguageCode,
          ),
          icon: Icons.translate_rounded,
          selected: _isSelected(
            option: AppLocalePreference.english,
            current: preference,
            currentLanguageCode: currentLanguageCode,
          ),
          onTap: () =>
              _updateLocale(context, ref, AppLocalePreference.english, copy),
        ),
      ],
    );
  }

  bool _isSelected({
    required AppLocalePreference option,
    required AppLocalePreference current,
    required String currentLanguageCode,
  }) {
    if (current == AppLocalePreference.system) {
      return option.locale?.languageCode == currentLanguageCode;
    }

    return current == option;
  }

  String? _subtitleFor({
    required SettingsCopy copy,
    required AppLocalePreference option,
    required AppLocalePreference current,
    required String currentLanguageCode,
  }) {
    if (current != AppLocalePreference.system) {
      return null;
    }

    return option.locale?.languageCode == currentLanguageCode
        ? copy.usingDeviceLanguage
        : null;
  }

  Future<void> _updateLocale(
    BuildContext context,
    WidgetRef ref,
    AppLocalePreference preference,
    SettingsCopy copy,
  ) async {
    try {
      await ref
          .read(localeControllerProvider.notifier)
          .updateLocale(preference);
    } catch (_) {
      if (!context.mounted) {
        return;
      }

      final messenger = ScaffoldMessenger.of(context);
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(copy.languageSaveError)));
    }
  }
}
