import 'package:flutter/material.dart';

import 'app_theme_preference.dart';
import 'theme_extensions.dart';
import 'theme_tokens.dart';

abstract final class ThemeFactory {
  static ThemeData build({
    required AppThemeFamily family,
    required Brightness brightness,
  }) {
    final tokens = AppThemeTokenFactory.resolve(family, brightness);
    final colors = tokens.colors;
    final spacing = tokens.spacing;
    final radius = tokens.radius;
    final typography = tokens.typography;
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      error: colors.error,
      onError: colors.onPrimary,
      surface: colors.surface,
      onSurface: colors.onSurface,
    );
    final baseTextTheme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorScheme: colorScheme,
    ).textTheme;
    final textTheme = baseTextTheme.copyWith(
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        fontFamily: typography.fontFamily,
        fontSize: typography.bodySize,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        fontFamily: typography.fontFamily,
        fontSize: typography.bodySize,
      ),
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontFamily: typography.fontFamily,
        fontSize: typography.labelSize,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontFamily: typography.fontFamily,
        fontSize: typography.titleSize,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        fontFamily: typography.fontFamily,
        fontSize: typography.headlineSize,
        fontWeight: FontWeight.w800,
      ),
      displaySmall: baseTextTheme.displaySmall?.copyWith(
        fontFamily: typography.fontFamily,
        fontSize: typography.displaySize,
        fontWeight: FontWeight.w800,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          color: colors.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.md),
          side: BorderSide(color: colors.outline.withValues(alpha: 0.2)),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceContainer,
        selectedColor: colors.primary,
        secondarySelectedColor: colors.secondary,
        labelStyle: textTheme.labelLarge?.copyWith(color: colors.onSurface),
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(
          color: colors.onPrimary,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.xs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.pill),
        ),
        side: BorderSide.none,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.md),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.md),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.md),
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
      ),
      extensions: [
        AppColorThemeExtension.fromTokens(colors),
        AppSpacingThemeExtension.fromTokens(spacing),
        AppRadiusThemeExtension.fromTokens(radius),
        AppTypographyThemeExtension.fromTokens(typography),
      ],
    );
  }
}
