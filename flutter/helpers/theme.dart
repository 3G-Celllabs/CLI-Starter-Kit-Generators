import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppThemeColors.white,
      brightness: Brightness.light,
      focusColor: AppThemeColors.black,
      textTheme: _buildTextTheme(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppThemeColors.black,
      brightness: Brightness.dark,
      focusColor: AppThemeColors.white,
      textTheme: _buildTextTheme(),
    );
  }

  static TextTheme _buildTextTheme() => TextTheme(
        displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 56,
          height: 64 / 56,
          letterSpacing: -0.25,
        ),
        displayMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 44,
          height: 52 / 44,
        ),
        displaySmall: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 36,
          height: 44 / 36,
        ),
        headlineLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 32,
          height: 40 / 32,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 28,
          height: 36 / 28,
        ),
        headlineSmall: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          height: 32 / 24,
        ),
        titleLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          height: 32 / 20,
          color: AppThemeColors.textPrimaryColor,
        ),
        titleMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 0.1,
        ),
        titleSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 20 / 14,
          color: AppThemeColors.textSecondaryColor,
        ),
        labelLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          height: 20 / 14,
        ),
        labelMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 16 / 12,
        ),
        labelSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 11,
          height: 16 / 11,
          color: AppThemeColors.black,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 24 / 16,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
          color: AppThemeColors.textSecondaryColor,
        ),
        bodySmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 16 / 12,
        ),
      );
}

class AppThemeColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color primary = Color(0xFFFFC838);
  static const Color primaryDark = Color(0xFFD6A014);

  static const Color secondary = Color(0xFF353E47);

  static const Color textPrimaryColor = Color(0xFF313B45);
  static const Color textSecondaryColor = Color(0xFF1C242C);
  static const Color textDisabledColor = Color.fromARGB(255, 162, 162, 162);
  static const Color textErrorColor = Color(0xFFED2525);

  static const Color dividerColor = Color(0xFF414C57);
  static const Color verticalDividerColor = Color(0xFFCF9F19);

  static const LinearGradient greenBtn = LinearGradient(
    colors: [Color(0xFFF7FFF6), Color(0xFFDAF5D5)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}
