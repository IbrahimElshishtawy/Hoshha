import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';

import '../localization/localization_providers.dart';
import '../theme/theme_providers.dart';
import 'app_providers.dart';
import 'bootstrap/app_bootstrap_controller.dart';
import 'router/app_router.dart';

class HoshhaApp extends ConsumerWidget {
  const HoshhaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(appEnvironmentProvider);
    final router = ref.watch(appRouterProvider);
    final themeConfiguration = ref.watch(appThemeConfigurationProvider);
    final locale = ref.watch(currentLocaleProvider);
    ref.watch(appBootstrapControllerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: environment.appName,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      routerConfig: router,
      theme: themeConfiguration.theme,
      darkTheme: themeConfiguration.darkTheme,
      themeMode: themeConfiguration.themeMode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
