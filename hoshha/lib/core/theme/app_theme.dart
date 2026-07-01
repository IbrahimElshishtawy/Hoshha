import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Colors
  static const Color surface = Color(0xFFFAF8FF);
  static const Color surfaceDim = Color(0xFFD9D9E5);
  static const Color surfaceBright = Color(0xFFFAF8FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF3F3FE);
  static const Color surfaceContainer = Color(0xFFEDEDF9);
  static const Color surfaceContainerHigh = Color(0xFFE7E7F3);
  static const Color surfaceContainerHighest = Color(0xFFE1E2ED);
  static const Color onSurface = Color(0xFF191B23);
  static const Color onSurfaceVariant = Color(0xFF434655);
  static const Color inverseSurface = Color(0xFF2E3039);
  static const Color inverseOnSurface = Color(0xFFF0F0FB);
  static const Color outline = Color(0xFF737686);
  static const Color outlineVariant = Color(0xFFC3C6D7);
  static const Color surfaceTint = Color(0xFF0053DB);
  static const Color primary = Color(0xFF004AC6);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF2563EB);
  static const Color onPrimaryContainer = Color(0xFFEEEFFF);
  static const Color inversePrimary = Color(0xFFB4C5FF);
  static const Color secondary = Color(0xFF006C49);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFF6CF8BB);
  static const Color onSecondaryContainer = Color(0xFF00714D);
  static const Color tertiary = Color(0xFFAB0B1C);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFCF2C30);
  static const Color onTertiaryContainer = Color(0xFFFFECEA);
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);
  static const Color primaryFixed = Color(0xFFDBE1FF);
  static const Color primaryFixedDim = Color(0xFFB4C5FF);
  static const Color onPrimaryFixed = Color(0xFF00174B);
  static const Color onPrimaryFixedVariant = Color(0xFF003EA8);
  static const Color secondaryFixed = Color(0xFF6FFBBE);
  static const Color secondaryFixedDim = Color(0xFF4EDEA3);
  static const Color onSecondaryFixed = Color(0xFF002113);
  static const Color onSecondaryFixedVariant = Color(0xFF005236);
  static const Color tertiaryFixed = Color(0xFFFFDAD7);
  static const Color tertiaryFixedDim = Color(0xFFFFB3AD);
  static const Color onTertiaryFixed = Color(0xFF410004);
  static const Color onTertiaryFixedVariant = Color(0xFF930013);
  static const Color background = Color(0xFFFAF8FF);
  static const Color onBackground = Color(0xFF191B23);
  static const Color surfaceVariant = Color(0xFFE1E2ED);
  static const Color shadow = Color(0xFF000000);

  // Spacing & Corner Radius
  static const double radiusSm = 4.0;
  static const double radiusDefault = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  static const double containerMargin = 20.0;
  static const double stackGap = 16.0;
  static const double inlineGap = 12.0;
  static const double sectionPadding = 24.0;
  static const double radiusCard = 20.0;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        shadow: Colors.black12,
        inverseSurface: inverseSurface,
        onInverseSurface: inverseOnSurface,
        inversePrimary: inversePrimary,
        surfaceTint: surfaceTint,
      ),
      scaffoldBackgroundColor: surface,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.beVietnamPro(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02,
          color: onBackground,
        ),
        headlineLarge: GoogleFonts.beVietnamPro(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: onBackground,
        ),
        headlineMedium: GoogleFonts.beVietnamPro(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: onBackground,
        ),
        headlineSmall: GoogleFonts.beVietnamPro(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: onBackground,
        ),
        bodyLarge: GoogleFonts.ibmPlexSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: onBackground,
        ),
        bodyMedium: GoogleFonts.ibmPlexSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: onBackground,
        ),
        labelSmall: GoogleFonts.ibmPlexSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.05,
          color: onBackground,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceContainerLowest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          borderSide: const BorderSide(color: primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          borderSide: const BorderSide(color: error, width: 1.5),
        ),
        hintStyle: GoogleFonts.ibmPlexSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: onSurfaceVariant,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size.fromHeight(56.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusFull),
          ),
          elevation: 0,
          textStyle: GoogleFonts.beVietnamPro(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: Color(0xFF191B23), // Dark surface
        onSurface: Color(0xFFFAF8FF),
        onSurfaceVariant: Color(0xFFC3C6D7),
        outline: outline,
        outlineVariant: outlineVariant,
        shadow: Colors.black45,
        inverseSurface: inverseSurface,
        onInverseSurface: inverseOnSurface,
        inversePrimary: inversePrimary,
        surfaceTint: surfaceTint,
      ),
      scaffoldBackgroundColor: const Color(0xFF191B23),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.beVietnamPro(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02,
          color: const Color(0xFFFAF8FF),
        ),
        headlineLarge: GoogleFonts.beVietnamPro(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFFAF8FF),
        ),
        headlineMedium: GoogleFonts.beVietnamPro(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFFAF8FF),
        ),
        headlineSmall: GoogleFonts.beVietnamPro(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFFAF8FF),
        ),
        bodyLarge: GoogleFonts.ibmPlexSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFFAF8FF),
        ),
        bodyMedium: GoogleFonts.ibmPlexSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFFAF8FF),
        ),
        labelSmall: GoogleFonts.ibmPlexSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.05,
          color: const Color(0xFFFAF8FF),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2E3039),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          borderSide: const BorderSide(color: primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusCard),
          borderSide: const BorderSide(color: error, width: 1.5),
        ),
        hintStyle: GoogleFonts.ibmPlexSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFC3C6D7),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size.fromHeight(56.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusFull),
          ),
          elevation: 0,
          textStyle: GoogleFonts.beVietnamPro(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
