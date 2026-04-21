import 'package:flutter/material.dart';

import 'app_theme_preference.dart';

class AppThemeTokens {
  const AppThemeTokens({
    required this.colors,
    required this.spacing,
    required this.radius,
    required this.typography,
  });

  final AppColorTokens colors;
  final AppSpacingTokens spacing;
  final AppRadiusTokens radius;
  final AppTypographyTokens typography;
}

class AppColorTokens {
  const AppColorTokens({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.surfaceContainer,
    required this.background,
    required this.outline,
    required this.success,
    required this.warning,
    required this.error,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color surface;
  final Color onSurface;
  final Color surfaceContainer;
  final Color background;
  final Color outline;
  final Color success;
  final Color warning;
  final Color error;
}

class AppSpacingTokens {
  const AppSpacingTokens({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
}

class AppRadiusTokens {
  const AppRadiusTokens({
    required this.sm,
    required this.md,
    required this.lg,
    required this.pill,
  });

  final double sm;
  final double md;
  final double lg;
  final double pill;
}

class AppTypographyTokens {
  const AppTypographyTokens({
    required this.fontFamily,
    required this.bodySize,
    required this.labelSize,
    required this.titleSize,
    required this.headlineSize,
    required this.displaySize,
  });

  final String? fontFamily;
  final double bodySize;
  final double labelSize;
  final double titleSize;
  final double headlineSize;
  final double displaySize;
}

abstract final class AppThemeTokenFactory {
  static AppThemeTokens resolve(AppThemeFamily family, Brightness brightness) {
    final spacing = const AppSpacingTokens(
      xs: 4,
      sm: 8,
      md: 16,
      lg: 24,
      xl: 32,
    );
    final radius = const AppRadiusTokens(sm: 8, md: 16, lg: 24, pill: 999);
    const typography = AppTypographyTokens(
      fontFamily: null,
      bodySize: 16,
      labelSize: 14,
      titleSize: 20,
      headlineSize: 30,
      displaySize: 38,
    );

    final colors = switch ((family, brightness)) {
      (AppThemeFamily.jade, Brightness.light) => const AppColorTokens(
        primary: Color(0xFF0B6E4F),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFF0E9F6E),
        onSecondary: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF15231E),
        surfaceContainer: Color(0xFFF1F6F3),
        background: Color(0xFFF7FAF8),
        outline: Color(0xFFB6C7BE),
        success: Color(0xFF1B8A5A),
        warning: Color(0xFFB67616),
        error: Color(0xFFB3261E),
      ),
      (AppThemeFamily.jade, Brightness.dark) => const AppColorTokens(
        primary: Color(0xFF6AD8AE),
        onPrimary: Color(0xFF003826),
        secondary: Color(0xFF8DE3C0),
        onSecondary: Color(0xFF003826),
        surface: Color(0xFF111816),
        onSurface: Color(0xFFE1EAE4),
        surfaceContainer: Color(0xFF1B2521),
        background: Color(0xFF0B100F),
        outline: Color(0xFF4E6359),
        success: Color(0xFF75DFAF),
        warning: Color(0xFFF2C270),
        error: Color(0xFFF2B8B5),
      ),
      (AppThemeFamily.sunset, Brightness.light) => const AppColorTokens(
        primary: Color(0xFFAA5A18),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFD17E2B),
        onSecondary: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF27180F),
        surfaceContainer: Color(0xFFFCF3EA),
        background: Color(0xFFFEF8F3),
        outline: Color(0xFFD8B9A1),
        success: Color(0xFF297B4B),
        warning: Color(0xFFD17E2B),
        error: Color(0xFFBA1A1A),
      ),
      (AppThemeFamily.sunset, Brightness.dark) => const AppColorTokens(
        primary: Color(0xFFFFB77B),
        onPrimary: Color(0xFF5A2600),
        secondary: Color(0xFFFFC995),
        onSecondary: Color(0xFF5A2600),
        surface: Color(0xFF1A120D),
        onSurface: Color(0xFFF3DFD0),
        surfaceContainer: Color(0xFF271C15),
        background: Color(0xFF130C08),
        outline: Color(0xFF8D715E),
        success: Color(0xFF8FD9AA),
        warning: Color(0xFFFFC86B),
        error: Color(0xFFFFB4AB),
      ),
      (AppThemeFamily.onyx, Brightness.light) => const AppColorTokens(
        primary: Color(0xFF006D3B),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFF00875A),
        onSecondary: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF002114),
        surfaceContainer: Color(0xFFE7F5EE),
        background: Color(0xFFFAFDF9),
        outline: Color(0xFFB6C7BE),
        success: Color(0xFF1B8A5A),
        warning: Color(0xFFB67616),
        error: Color(0xFFB3261E),
      ),
      (AppThemeFamily.onyx, Brightness.dark) => const AppColorTokens(
        primary: Color(0xFF6AD8AE),
        onPrimary: Color(0xFF003826),
        secondary: Color(0xFF8DE3C0),
        onSecondary: Color(0xFF003826),
        surface: Color(0xFF111816),
        onSurface: Color(0xFFE1EAE4),
        surfaceContainer: Color(0xFF1B2521),
        background: Color(0xFF0B100F),
        outline: Color(0xFF4E6359),
        success: Color(0xFF75DFAF),
        warning: Color(0xFFF2C270),
        error: Color(0xFFF2B8B5),
      ),
    };

    return AppThemeTokens(
      colors: colors,
      spacing: spacing,
      radius: radius,
      typography: typography,
    );
  }
}
