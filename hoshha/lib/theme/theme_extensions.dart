import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import 'theme_tokens.dart';

@immutable
class AppColorThemeExtension extends ThemeExtension<AppColorThemeExtension> {
  const AppColorThemeExtension({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surfaceContainer,
    required this.success,
    required this.warning,
    required this.error,
    required this.outline,
  });

  factory AppColorThemeExtension.fromTokens(AppColorTokens tokens) {
    return AppColorThemeExtension(
      primary: tokens.primary,
      onPrimary: tokens.onPrimary,
      secondary: tokens.secondary,
      onSecondary: tokens.onSecondary,
      surfaceContainer: tokens.surfaceContainer,
      success: tokens.success,
      warning: tokens.warning,
      error: tokens.error,
      outline: tokens.outline,
    );
  }

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color surfaceContainer;
  final Color success;
  final Color warning;
  final Color error;
  final Color outline;

  @override
  AppColorThemeExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surfaceContainer,
    Color? success,
    Color? warning,
    Color? error,
    Color? outline,
  }) {
    return AppColorThemeExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      outline: outline ?? this.outline,
    );
  }

  @override
  AppColorThemeExtension lerp(
    ThemeExtension<AppColorThemeExtension>? other,
    double t,
  ) {
    if (other is! AppColorThemeExtension) {
      return this;
    }

    return AppColorThemeExtension(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t) ?? onSecondary,
      surfaceContainer:
          Color.lerp(surfaceContainer, other.surfaceContainer, t) ??
          surfaceContainer,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      error: Color.lerp(error, other.error, t) ?? error,
      outline: Color.lerp(outline, other.outline, t) ?? outline,
    );
  }
}

@immutable
class AppSpacingThemeExtension
    extends ThemeExtension<AppSpacingThemeExtension> {
  const AppSpacingThemeExtension({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  factory AppSpacingThemeExtension.fromTokens(AppSpacingTokens tokens) {
    return AppSpacingThemeExtension(
      xs: tokens.xs,
      sm: tokens.sm,
      md: tokens.md,
      lg: tokens.lg,
      xl: tokens.xl,
    );
  }

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  @override
  AppSpacingThemeExtension copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    return AppSpacingThemeExtension(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  AppSpacingThemeExtension lerp(
    ThemeExtension<AppSpacingThemeExtension>? other,
    double t,
  ) {
    if (other is! AppSpacingThemeExtension) {
      return this;
    }

    return AppSpacingThemeExtension(
      xs: lerpDouble(xs, other.xs, t) ?? xs,
      sm: lerpDouble(sm, other.sm, t) ?? sm,
      md: lerpDouble(md, other.md, t) ?? md,
      lg: lerpDouble(lg, other.lg, t) ?? lg,
      xl: lerpDouble(xl, other.xl, t) ?? xl,
    );
  }
}

@immutable
class AppRadiusThemeExtension extends ThemeExtension<AppRadiusThemeExtension> {
  const AppRadiusThemeExtension({
    required this.sm,
    required this.md,
    required this.lg,
    required this.pill,
  });

  factory AppRadiusThemeExtension.fromTokens(AppRadiusTokens tokens) {
    return AppRadiusThemeExtension(
      sm: tokens.sm,
      md: tokens.md,
      lg: tokens.lg,
      pill: tokens.pill,
    );
  }

  final double sm;
  final double md;
  final double lg;
  final double pill;

  @override
  AppRadiusThemeExtension copyWith({
    double? sm,
    double? md,
    double? lg,
    double? pill,
  }) {
    return AppRadiusThemeExtension(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      pill: pill ?? this.pill,
    );
  }

  @override
  AppRadiusThemeExtension lerp(
    ThemeExtension<AppRadiusThemeExtension>? other,
    double t,
  ) {
    if (other is! AppRadiusThemeExtension) {
      return this;
    }

    return AppRadiusThemeExtension(
      sm: lerpDouble(sm, other.sm, t) ?? sm,
      md: lerpDouble(md, other.md, t) ?? md,
      lg: lerpDouble(lg, other.lg, t) ?? lg,
      pill: lerpDouble(pill, other.pill, t) ?? pill,
    );
  }
}

@immutable
class AppTypographyThemeExtension
    extends ThemeExtension<AppTypographyThemeExtension> {
  const AppTypographyThemeExtension({
    required this.fontFamily,
    required this.bodySize,
    required this.labelSize,
    required this.titleSize,
    required this.headlineSize,
    required this.displaySize,
  });

  factory AppTypographyThemeExtension.fromTokens(AppTypographyTokens tokens) {
    return AppTypographyThemeExtension(
      fontFamily: tokens.fontFamily,
      bodySize: tokens.bodySize,
      labelSize: tokens.labelSize,
      titleSize: tokens.titleSize,
      headlineSize: tokens.headlineSize,
      displaySize: tokens.displaySize,
    );
  }

  final String? fontFamily;
  final double bodySize;
  final double labelSize;
  final double titleSize;
  final double headlineSize;
  final double displaySize;

  @override
  AppTypographyThemeExtension copyWith({
    String? fontFamily,
    double? bodySize,
    double? labelSize,
    double? titleSize,
    double? headlineSize,
    double? displaySize,
  }) {
    return AppTypographyThemeExtension(
      fontFamily: fontFamily ?? this.fontFamily,
      bodySize: bodySize ?? this.bodySize,
      labelSize: labelSize ?? this.labelSize,
      titleSize: titleSize ?? this.titleSize,
      headlineSize: headlineSize ?? this.headlineSize,
      displaySize: displaySize ?? this.displaySize,
    );
  }

  @override
  AppTypographyThemeExtension lerp(
    ThemeExtension<AppTypographyThemeExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyThemeExtension) {
      return this;
    }

    return AppTypographyThemeExtension(
      fontFamily: t < 0.5 ? fontFamily : other.fontFamily,
      bodySize: lerpDouble(bodySize, other.bodySize, t) ?? bodySize,
      labelSize: lerpDouble(labelSize, other.labelSize, t) ?? labelSize,
      titleSize: lerpDouble(titleSize, other.titleSize, t) ?? titleSize,
      headlineSize:
          lerpDouble(headlineSize, other.headlineSize, t) ?? headlineSize,
      displaySize: lerpDouble(displaySize, other.displaySize, t) ?? displaySize,
    );
  }
}

extension AppThemeContextX on BuildContext {
  AppColorThemeExtension get appColors =>
      Theme.of(this).extension<AppColorThemeExtension>()!;

  AppSpacingThemeExtension get appSpacing =>
      Theme.of(this).extension<AppSpacingThemeExtension>()!;

  AppRadiusThemeExtension get appRadius =>
      Theme.of(this).extension<AppRadiusThemeExtension>()!;

  AppTypographyThemeExtension get appTypography =>
      Theme.of(this).extension<AppTypographyThemeExtension>()!;
}
