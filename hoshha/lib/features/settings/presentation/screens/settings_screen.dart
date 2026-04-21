import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import '../settings_copy.dart';
import '../widgets/app_info_section.dart';
import '../widgets/language_selector.dart';
import '../widgets/reset_data_tile.dart';
import '../widgets/theme_selector.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _maxContentWidth = 600.0;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final copy = SettingsCopy.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(copy.screenTitle)),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxContentWidth),
            child: ListView(
              padding: EdgeInsetsDirectional.fromSTEB(
                spacing.lg,
                spacing.lg,
                spacing.lg,
                spacing.xl,
              ),
              children: [
                const ThemeSelector(),
                SizedBox(height: spacing.lg),
                const LanguageSelector(),
                SizedBox(height: spacing.lg),
                const AppInfoSection(),
                SizedBox(height: spacing.lg),
                const ResetDataTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
