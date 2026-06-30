import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';

class HoshhaApp extends StatelessWidget {
  const HoshhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hawsha',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // Default to Arabic locale to show the RTL interface
      locale: const Locale('ar'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.login,
    );
  }
}
