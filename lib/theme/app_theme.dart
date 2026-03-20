import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const background = Color(0xFF131313);
  static const surface = Color(0xFF131313);
  static const surfaceContainerLowest = Color(0xFF0E0E0E);
  static const surfaceContainerLow = Color(0xFF1B1B1B);
  static const surfaceContainer = Color(0xFF1F1F1F);
  static const surfaceContainerHigh = Color(0xFF2A2A2A);
  static const surfaceContainerHighest = Color(0xFF353535);
  static const primary = Color(0xFFFFB4AA);
  static const primaryContainer = Color(0xFFE4000F);
  static const onPrimaryContainer = Color(0xFFFFF5F3);
  static const secondary = Color(0xFF82CFFF);
  static const secondaryContainer = Color(0xFF00ABEC);
  static const onSecondaryContainer = Color(0xFF003C55);
  static const tertiary = Color(0xFFC7C6C6);
  static const onSurface = Color(0xFFE2E2E2);
  static const onSurfaceVariant = Color(0xFFE9BCB6);
  static const outline = Color(0xFF8C7B78);
}

class AppTheme {
  static ThemeData get darkTheme {
    final textTheme = GoogleFonts.spaceGroteskTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.w700,
          letterSpacing: 4,
          color: AppColors.onSurface,
        ),
        displayMedium: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          letterSpacing: 3,
          color: AppColors.onSurface,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          color: AppColors.onSurface,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          color: AppColors.onSurface,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          color: AppColors.onSurface,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
          color: AppColors.onSurface,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
          color: AppColors.onSurface,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
          color: AppColors.onSurface,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
          color: AppColors.onSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.onSurface,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.onSurfaceVariant,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
          color: AppColors.onSurface,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
          color: AppColors.onSurface,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
          color: AppColors.onSurface,
        ),
      ),
    );

    const noRadius = RoundedRectangleBorder();
    const noRadiusCircular = RoundedRectangleBorder();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.background,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondaryContainer,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        surfaceContainerLowest: AppColors.surfaceContainerLowest,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        surfaceContainer: AppColors.surfaceContainer,
        surfaceContainerHigh: AppColors.surfaceContainerHigh,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceContainerLowest,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 3,
          color: AppColors.primary,
        ),
        iconTheme: const IconThemeData(color: AppColors.onSurface),
        shape: noRadius,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surfaceContainerLow,
        elevation: 0,
        shape: noRadius,
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryContainer,
          foregroundColor: AppColors.onPrimaryContainer,
          shape: noRadius,
          elevation: 0,
          textStyle: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1),
          shape: noRadius,
          textStyle: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: noRadius,
          textStyle: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceContainerHigh,
        labelStyle: GoogleFonts.spaceGrotesk(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
          color: AppColors.onSurface,
        ),
        shape: noRadiusCircular,
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.surfaceContainerHigh,
        thickness: 1,
        space: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceContainerLowest,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.spaceGrotesk(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
        unselectedLabelStyle: GoogleFonts.spaceGrotesk(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
        elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surfaceContainerLowest,
        indicatorColor: AppColors.primaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.spaceGrotesk(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: AppColors.onPrimaryContainer,
            );
          }
          return GoogleFonts.spaceGrotesk(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
            color: AppColors.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.onPrimaryContainer);
          }
          return const IconThemeData(color: AppColors.onSurfaceVariant);
        }),
        elevation: 0,
        indicatorShape: noRadiusCircular,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.outline),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.outline),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.primary),
        ),
        filled: true,
        fillColor: AppColors.surfaceContainerLow,
        labelStyle: GoogleFonts.spaceGrotesk(color: AppColors.onSurfaceVariant),
      ),
    );
  }
}
