import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      backgroundColor: AppThemeColors.white,
      brightness: Brightness.light,
      focusColor: AppThemeColors.black,
      textTheme: _buildTextTheme(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      backgroundColor: AppThemeColors.black,
      brightness: Brightness.dark,
      focusColor: AppThemeColors.white,
      textTheme: _buildTextTheme(),
    );
  }

  static TextTheme _buildTextTheme() {
    return TextTheme(
      headline1: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 48.0,
      ),
      headline2: TextStyle(
        fontFamily: '',
        color: AppThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 34.0,
      ),
      headline3: TextStyle(
        fontFamily: '',
        fontWeight: FontWeight.bold,
        color: AppThemeColors.textPrimaryColor,
        fontSize: 28.0,
      ),
      headline4: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      headline5: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      headline6: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textSecondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      subtitle1: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textPrimaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      ),
      subtitle2: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textSecondaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      ),
      bodyText1: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textPrimaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      ),
      bodyText2: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textSecondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      ),
      button: TextStyle(
        fontFamily: '',
        color: AppThemeColors.textPrimaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      ),
      caption: TextStyle(
        fontFamily: '',
        fontWeight: FontWeight.w300,
        color: AppThemeColors.white,
        fontSize: 12.0,
      ),
    );
  }
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
