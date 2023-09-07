import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class COutlinedButtonTheme {
  COutlinedButtonTheme._(); //To avoid creating instants

  //Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: cPrimaryColor, // Use the primary color for text
      )),
      side: MaterialStateProperty.all(const BorderSide(
          color: cPrimaryColor)), // Use the primary color for border
      backgroundColor: MaterialStateProperty.all(
          Colors.transparent), // Transparent background
    ),
  );

  //Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: cDarkPrimaryColor, // Use the dark primary color for text
      )),
      side: MaterialStateProperty.all(const BorderSide(
          color: cDarkPrimaryColor)), // Use the dark primary color for border
      backgroundColor: MaterialStateProperty.all(
          Colors.transparent), // Transparent background
    ),
  );
}
