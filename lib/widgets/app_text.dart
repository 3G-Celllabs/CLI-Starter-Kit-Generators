import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  // Heading style for major titles
  static TextStyle heading = GoogleFonts.nunito(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Subheading style for section titles
  static TextStyle subheading = GoogleFonts.nunito(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  // Body text style for regular content
  static TextStyle body = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  // Caption style for smaller text
  static TextStyle caption = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black45,
  );

  // Button text style
  static TextStyle button = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Error text style for validation messages
  static TextStyle error = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );
}
