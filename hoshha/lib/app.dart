import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/presentation/cubit/settings_cubit.dart';
import 'features/settings/presentation/cubit/settings_state.dart';
import 'injection_container.dart';

class HoshhaApp extends StatelessWidget {
  const HoshhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingsCubit>()..loadSettings(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          bool isDarkMode = false;
          String languageCode = 'ar';

          if (state is SettingsLoaded) {
            isDarkMode = state.setting.isDarkMode;
            languageCode = state.setting.languageCode;
          }

          return MaterialApp(
            title: 'Hawsha',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            locale: Locale(languageCode),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: AppRoutes.login,
          );
        },
      ),
    );
  }
}
