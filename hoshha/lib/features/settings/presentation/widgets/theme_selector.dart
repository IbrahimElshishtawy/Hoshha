import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/app_theme_preference.dart';
import '../../../../theme/theme_providers.dart';
import '../settings_copy.dart';
import 'settings_section.dart';
import 'settings_tile.dart';

class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copy = SettingsCopy.of(context);
    final preference =
        ref.watch(themeControllerProvider).asData?.value ??
        const AppThemePreference.defaults();

    return SettingsSection(
      title: copy.appearanceSectionTitle,
      children: [
        SettingsTile(
          title: copy.themeSystem,
          icon: Icons.settings_suggest_rounded,
          selected: preference.mode == AppThemeModePreference.system,
          onTap: () =>
              _updateTheme(context, ref, AppThemeModePreference.system, copy),
        ),
        SettingsTile(
          title: copy.themeLight,
          icon: Icons.light_mode_rounded,
          selected: preference.mode == AppThemeModePreference.light,
          onTap: () =>
              _updateTheme(context, ref, AppThemeModePreference.light, copy),
        ),
        SettingsTile(
          title: copy.themeDark,
          icon: Icons.dark_mode_rounded,
          selected: preference.mode == AppThemeModePreference.dark,
          onTap: () =>
              _updateTheme(context, ref, AppThemeModePreference.dark, copy),
        ),
      ],
    );
  }

  Future<void> _updateTheme(
    BuildContext context,
    WidgetRef ref,
    AppThemeModePreference mode,
    SettingsCopy copy,
  ) async {
    try {
      await ref.read(themeControllerProvider.notifier).updateMode(mode);
    } catch (_) {
      if (!context.mounted) {
        return;
      }

      final messenger = ScaffoldMessenger.of(context);
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(copy.themeSaveError)));
    }
  }
}
