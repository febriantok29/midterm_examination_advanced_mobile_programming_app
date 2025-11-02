import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1A374D);
  static const Color primaryLight = Color(0xFF6998AB);
  static const Color primaryDark = Color(0xFF0F2133);
  static const Color primaryContainer = Color(0xFFB1D0E0);

  static const Color secondary = Color(0xFF406882);
  static const Color secondaryLight = Color(0xFF6998AB);
  static const Color secondaryDark = Color(0xFF2A4A5E);
  static const Color secondaryContainer = Color(0xFFD4E6F1);

  static const Color tertiary = Color(0xFF6998AB);
  static const Color tertiaryLight = Color(0xFF8FB3C4);
  static const Color tertiaryDark = Color(0xFF4A7589);
  static const Color tertiaryContainer = Color(0xFFE8F4F8);

  static const Color success = Color(0xFF6998AB);
  static const Color successLight = Color(0xFFB1D0E0);
  static const Color successDark = Color(0xFF406882);
  static const Color successContainer = Color(0xFFE8F4F8);

  static const Color warning = Color(0xFF406882);
  static const Color warningLight = Color(0xFF6998AB);
  static const Color warningDark = Color(0xFF1A374D);
  static const Color warningContainer = Color(0xFFD4E6F1);

  static const Color error = Color(0xFFDC3545);
  static const Color errorLight = Color(0xFFF8D7DA);
  static const Color errorDark = Color(0xFFA02733);
  static const Color errorContainer = Color(0xFFF9DEDC);

  static const Color info = Color(0xFF6998AB);
  static const Color infoLight = Color(0xFFB1D0E0);
  static const Color infoDark = Color(0xFF406882);
  static const Color infoContainer = Color(0xFFE8F4F8);

  static const Color background = Color(0xFFFAFBFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFE8F4F8);
  static const Color surfaceTint = Color(0xFF1A374D);

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF1A374D);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF1A374D);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFF1A374D);
  static const Color onBackground = Color(0xFF1A374D);
  static const Color onSurface = Color(0xFF1A374D);
  static const Color onSurfaceVariant = Color(0xFF406882);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF5F0A0A);

  static const Color outline = Color(0xFF6998AB);
  static const Color outlineVariant = Color(0xFFB1D0E0);
  static const Color shadow = Color(0xFF1A374D);
  static const Color scrim = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryContainer, background],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [success, successLight],
  );

  static const LinearGradient infoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [info, infoLight],
  );

  static const LinearGradient warningGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [warning, warningLight],
  );

  static Color primaryOpacity(double opacity) =>
      primary.withValues(alpha: opacity);
  static Color successOpacity(double opacity) =>
      success.withValues(alpha: opacity);
  static Color warningOpacity(double opacity) =>
      warning.withValues(alpha: opacity);
  static Color errorOpacity(double opacity) => error.withValues(alpha: opacity);
  static Color infoOpacity(double opacity) => info.withValues(alpha: opacity);
  static Color shadowOpacity(double opacity) =>
      shadow.withValues(alpha: opacity);

  static const MaterialColor primarySwatch =
      MaterialColor(0xFF1A374D, <int, Color>{
        50: Color(0xFFE8F4F8),
        100: Color(0xFFD4E6F1),
        200: Color(0xFFB1D0E0),
        300: Color(0xFF8FB3C4),
        400: Color(0xFF6998AB),
        500: Color(0xFF406882),
        600: Color(0xFF2A4A5E),
        700: Color(0xFF1A374D),
        800: Color(0xFF0F2133),
        900: Color(0xFF050F19),
      });
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceContainerHighest: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        shadow: AppColors.shadow,
        scrim: AppColors.scrim,
        surfaceTint: AppColors.surfaceTint,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 2,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: AppColors.surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant.withValues(alpha: 0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.onSurface,
        contentTextStyle: const TextStyle(color: AppColors.surface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.surface,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
