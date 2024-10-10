import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _lightScheme = ColorScheme.light(
  // Error
  error: AppThemeColorsLight.bgError,
  onError: AppThemeColorsLight.textError,
  // Outline
  outline: AppThemeColorsLight.borderPrimary,
  outlineVariant: AppThemeColorsLight.borderSecondary,
  // Primary
  primary: AppThemeColorsLight.bgPrimary,
  onPrimary: AppThemeColorsLight.textPrimary,
  // Secondary
  secondary: AppThemeColorsLight.bgSecondary,
  onSecondary: AppThemeColorsLight.textSecondary,
  // Shadow
  shadow: AppThemeColorsLight.textTertiary,
  // Surface
  surface: kWhite,
  onSurface: kBlack,
  // Tertiary
  tertiary: AppThemeColorsLight.bgTertiary,
  onTertiary: AppThemeColorsLight.textTertiary,
);

const _darkScheme = ColorScheme.dark(
  // Error
  error: AppThemeColorsDark.bgError,
  onError: AppThemeColorsDark.textError,
  // Outline
  outline: AppThemeColorsDark.borderPrimary,
  outlineVariant: AppThemeColorsDark.borderSecondary,
  // Primary
  primary: AppThemeColorsDark.bgPrimary,
  onPrimary: AppThemeColorsDark.textPrimary,
  // Secondary
  secondary: AppThemeColorsDark.bgSecondary,
  onSecondary: AppThemeColorsDark.textSecondary,
  // Shadow
  shadow: AppThemeColorsDark.textTertiary,
  // Surface
  surface: kBlack,
  onSurface: kWhite,
  // Tertiary
  tertiary: AppThemeColorsDark.bgTertiary,
  onTertiary: AppThemeColorsDark.textTertiary,
);

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: _buildAppBarTheme(
          bg: kWhite,
          fg: kBlack,
        ),
        brightness: Brightness.light,
        cardTheme: _buildCardTheme(
          bg: kWhite,
          shadow: AppThemeColorsLight.textTertiary,
        ),
        colorScheme: _lightScheme,
        dividerTheme: _buildDividerTheme(context),
        dropdownMenuTheme: _buildDropDownMenuTheme(
          context: context,
          enabledBorderColor: AppThemeColorsLight.borderPrimary,
          focusedBorderColor: AppThemeColorsLight.textSecondary,
        ),
        elevatedButtonTheme: _buildElevatedButtonTheme(
          bg: AppThemeColorsLight.bgPrimary,
          fg: kWhite,
          shadow: AppThemeColorsLight.textTertiary,
        ),
        expansionTileTheme: _buildExpansionTileThemeData(
          bg: AppThemeColorsLight.bgTertiary,
          collapsedBg: kWhite,
        ),
        focusColor: kBlack,
        inputDecorationTheme: _buildInputDecorationTheme(
          context: context,
          disabledBorder: AppThemeColorsLight.textTertiary,
          enabledBorder: AppThemeColorsLight.borderPrimary,
          errorColor: AppThemeColorsLight.bgError,
          focusedBorder: kBlack,
          hintColor: AppThemeColorsLight.textTertiary,
          iconColor: AppThemeColorsLight.textSecondary,
        ),
        menuTheme: _buildMenuThemeData(bg: AppThemeColorsLight.textPrimary),
        outlinedButtonTheme: _buildOutlinedButtonThemeData(
          bg: kWhite,
          fg: AppThemeColorsLight.bgPrimary,
          shadow: AppThemeColorsLight.textTertiary,
        ),
        scaffoldBackgroundColor: kWhite,
        textTheme: _buildTextTheme(kBlack),
        useMaterial3: true,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        appBarTheme: _buildAppBarTheme(
          bg: kBlack,
          fg: kWhite,
        ),
        brightness: Brightness.dark,
        cardTheme: _buildCardTheme(
          bg: kBlack,
          shadow: AppThemeColorsDark.textTertiary,
        ),
        colorScheme: _darkScheme,
        dividerTheme: _buildDividerTheme(context),
        dropdownMenuTheme: _buildDropDownMenuTheme(
          context: context,
          enabledBorderColor: AppThemeColorsDark.borderPrimary,
          focusedBorderColor: AppThemeColorsDark.textSecondary,
        ),
        elevatedButtonTheme: _buildElevatedButtonTheme(
          bg: AppThemeColorsDark.bgPrimary,
          fg: kBlack,
          shadow: AppThemeColorsDark.textTertiary,
        ),
        expansionTileTheme: _buildExpansionTileThemeData(
          bg: AppThemeColorsDark.bgTertiary,
          collapsedBg: kBlack,
        ),
        focusColor: kWhite,
        inputDecorationTheme: _buildInputDecorationTheme(
          context: context,
          disabledBorder: AppThemeColorsDark.textTertiary,
          enabledBorder: AppThemeColorsDark.borderPrimary,
          errorColor: AppThemeColorsDark.bgError,
          focusedBorder: kWhite,
          hintColor: AppThemeColorsDark.textTertiary,
          iconColor: AppThemeColorsDark.textSecondary,
        ),
        menuTheme: _buildMenuThemeData(bg: AppThemeColorsDark.textPrimary),
        outlinedButtonTheme: _buildOutlinedButtonThemeData(
          bg: kBlack,
          fg: AppThemeColorsDark.bgPrimary,
          shadow: AppThemeColorsDark.textTertiary,
        ),
        scaffoldBackgroundColor: kBlack,
        textTheme: _buildTextTheme(kWhite),
        useMaterial3: true,
      );

  static AppBarTheme _buildAppBarTheme({
    required Color bg,
    required Color fg,
  }) =>
      AppBarTheme(
        backgroundColor: bg,
        centerTitle: false,
        elevation: 0,
        iconTheme: IconThemeData(
          color: fg,
          size: 20.0,
        ),
        titleSpacing: 0.0,
        titleTextStyle: _buildTextTheme(fg).titleLarge,
        toolbarHeight: 56.0,
      );

  static CardTheme _buildCardTheme(
          {required Color bg, required Color shadow}) =>
      CardTheme(
        color: bg,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        surfaceTintColor: bg,
        shadowColor: shadow.withOpacity(0.4),
      );

  static DividerThemeData _buildDividerTheme(BuildContext context) =>
      DividerThemeData(
        color: Theme.of(context).colorScheme.onTertiary,
        space: 1.0,
      );

  static DropdownMenuThemeData _buildDropDownMenuTheme({
    required BuildContext context,
    required Color enabledBorderColor,
    required Color focusedBorderColor,
  }) =>
      DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          constraints: const BoxConstraints(
            minWidth: 120.0,
            maxWidth: 600.0,
            maxHeight: 40.0,
          ),
          contentPadding: const EdgeInsets.only(left: 12.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: enabledBorderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          // filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusedBorderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          // isDense: true,
        ),
        menuStyle: MenuStyle(
          backgroundColor:
              WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium,
      );

  static ElevatedButtonThemeData _buildElevatedButtonTheme({
    required Color bg,
    required Color fg,
    required Color shadow,
  }) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: WidgetStatePropertyAll<Color>(bg),
          elevation: const WidgetStatePropertyAll<double>(0.0),
          foregroundColor: WidgetStatePropertyAll<Color>(fg),
          overlayColor: WidgetStatePropertyAll<Color>(bg.withOpacity(0.4)),
          shadowColor: WidgetStatePropertyAll<Color>(shadow),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      );

  static ExpansionTileThemeData _buildExpansionTileThemeData(
          {required Color bg, required Color collapsedBg}) =>
      ExpansionTileThemeData(
        backgroundColor: bg,
        collapsedBackgroundColor: collapsedBg,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0.0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      );

  static InputDecorationTheme _buildInputDecorationTheme({
    required BuildContext context,
    required Color disabledBorder,
    required Color enabledBorder,
    required Color errorColor,
    required Color focusedBorder,
    required Color hintColor,
    required Color iconColor,
  }) =>
      InputDecorationTheme(
        disabledBorder: _buildOutlineInputBorder(disabledBorder),
        enabledBorder: _buildOutlineInputBorder(enabledBorder),
        errorBorder: _buildOutlineInputBorder(errorColor),
        errorStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: errorColor,
              fontSize: 10.0,
            ),
        filled: false,
        focusedBorder: _buildOutlineInputBorder(focusedBorder),
        focusedErrorBorder: _buildOutlineInputBorder(errorColor),
        hintStyle:
            Theme.of(context).textTheme.bodyMedium?.copyWith(color: hintColor),
        isDense: true,
        prefixIconColor: iconColor,
        suffixIconColor: iconColor,
      );

  static MenuThemeData _buildMenuThemeData({required Color bg}) =>
      MenuThemeData(
        style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
            bg,
          ),
        ),
      );

  static OutlinedButtonThemeData _buildOutlinedButtonThemeData({
    required Color bg,
    required Color fg,
    required Color shadow,
  }) =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(bg),
          elevation: const WidgetStatePropertyAll<double>(0.0),
          foregroundColor: WidgetStatePropertyAll<Color>(fg),
          overlayColor: WidgetStatePropertyAll<Color>(fg.withOpacity(0.4)),
          shadowColor: WidgetStatePropertyAll<Color>(shadow),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          side: WidgetStatePropertyAll<BorderSide>(
            BorderSide(
              color: fg,
              width: 1.0,
            ),
          ),
        ),
      );

  static OutlineInputBorder _buildOutlineInputBorder(Color color) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
      );

  static TextTheme _buildTextTheme(Color primaryTextColor) => TextTheme(
        displayLarge: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 56,
          height: 64 / 56,
          letterSpacing: -0.25,
        ),
        displayMedium: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 44,
          height: 52 / 44,
        ),
        displaySmall: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 36,
          height: 44 / 36,
        ),
        headlineLarge: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 32,
          height: 40 / 32,
        ),
        headlineMedium: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 28,
          height: 36 / 28,
        ),
        headlineSmall: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 24,
          height: 32 / 24,
        ),
        titleLarge: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          height: 32 / 20,
        ),
        titleMedium: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 0.1,
        ),
        titleSmall: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 20 / 14,
        ),
        labelLarge: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 14,
          height: 20 / 14,
        ),
        labelMedium: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 16 / 12,
        ),
        labelSmall: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 10,
          height: 16 / 10,
        ),
        bodyLarge: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 24 / 16,
        ),
        bodyMedium: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
        ),
        bodySmall: GoogleFonts.nunito(
          color: primaryTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          height: 16 / 12,
        ),
      );
}
