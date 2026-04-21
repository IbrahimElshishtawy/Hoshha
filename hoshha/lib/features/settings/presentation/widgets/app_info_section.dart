import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../settings_copy.dart';
import 'settings_section.dart';
import 'settings_tile.dart';

class AppInfoSection extends StatefulWidget {
  const AppInfoSection({super.key});

  @override
  State<AppInfoSection> createState() => _AppInfoSectionState();
}

class _AppInfoSectionState extends State<AppInfoSection> {
  late final Future<PackageInfo> _packageInfoFuture;

  @override
  void initState() {
    super.initState();
    _packageInfoFuture = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    final copy = SettingsCopy.of(context);

    return FutureBuilder<PackageInfo>(
      future: _packageInfoFuture,
      builder: (context, snapshot) {
        final info = snapshot.data;
        final appName = (info?.appName.isNotEmpty ?? false)
            ? info!.appName
            : copy.appNameValue;
        final version = _versionLabel(info, copy);

        return SettingsSection(
          title: copy.appInfoSectionTitle,
          children: [
            SettingsTile(
              title: copy.appNameLabel,
              subtitle: appName,
              icon: Icons.apps_rounded,
            ),
            SettingsTile(
              title: copy.versionLabel,
              subtitle: version,
              icon: Icons.info_outline_rounded,
            ),
            SettingsTile(
              title: copy.aboutLabel,
              subtitle: copy.aboutSubtitle,
              icon: Icons.favorite_outline_rounded,
              onTap: () async {
                showAboutDialog(
                  context: context,
                  applicationName: appName,
                  applicationVersion: version,
                  applicationLegalese: copy.aboutSubtitle,
                );
              },
            ),
          ],
        );
      },
    );
  }

  String _versionLabel(PackageInfo? info, SettingsCopy copy) {
    if (info == null) {
      return copy.appVersionFallback;
    }

    if (info.buildNumber.isEmpty) {
      return info.version;
    }

    return '${info.version} (${info.buildNumber})';
  }
}
