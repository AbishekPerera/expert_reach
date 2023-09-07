import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expert_reach/constants/colors.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._(); //To avoid creating instants

  //Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255))),
          backgroundColor: MaterialStatePropertyAll(cPrimaryColor)));

  //Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255))),
          backgroundColor: MaterialStatePropertyAll(cDarkPrimaryColor)));
}
