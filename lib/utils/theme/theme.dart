import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expert_reach/utils/theme/elevated_button_theme.dart';
import 'package:expert_reach/utils/theme/outlined_button_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // brightness of the theme
    brightness: Brightness.light,

    // elevated button theme
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,

    // outlined button theme
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,

    // text theme
    textTheme: TextTheme(
      //For large banner like text
      displayLarge: GoogleFonts.inter(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      displayMedium: GoogleFonts.inter(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      displaySmall: GoogleFonts.inter(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[700]),

      //For normal text heading
      headlineLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),
      headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),
      headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),

      //For normal text
      titleLarge: GoogleFonts.inter(
        fontSize: 18,
        color: Colors.black,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        color: Colors.black,
      ),

      //For lables text
      labelLarge: GoogleFonts.inter(fontSize: 18, color: Colors.grey[900]),
      labelMedium: GoogleFonts.inter(fontSize: 16, color: Colors.grey[900]),
      labelSmall: GoogleFonts.inter(fontSize: 14, color: Colors.grey[900]),

      //For normal text
      bodyLarge: GoogleFonts.inter(fontSize: 18, color: Colors.black),
      bodyMedium: GoogleFonts.inter(fontSize: 16, color: Colors.black),
      bodySmall: GoogleFonts.inter(fontSize: 14, color: Colors.black),
    ),

    // app input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.inter(),
      labelStyle: GoogleFonts.inter(),
      errorStyle: GoogleFonts.inter(),
      helperStyle: GoogleFonts.inter(),
      prefixStyle: GoogleFonts.inter(),
      suffixStyle: GoogleFonts.inter(),
      counterStyle: GoogleFonts.inter(),
    ),

    primaryTextTheme: TextTheme(
      //For large banner like text
      displayLarge: GoogleFonts.inter(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      displayMedium: GoogleFonts.inter(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      displaySmall: GoogleFonts.inter(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[700]),

      //For normal text heading
      headlineLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),
      headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),
      headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),

      //For normal text
      titleLarge: GoogleFonts.inter(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
      titleMedium: GoogleFonts.inter(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w900),
      titleSmall: GoogleFonts.inter(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.w900),

      //For lables text
      labelLarge: GoogleFonts.inter(fontSize: 18, color: Colors.grey[900]),
      labelMedium: GoogleFonts.inter(fontSize: 16, color: Colors.grey[900]),
      labelSmall: GoogleFonts.inter(fontSize: 14, color: Colors.grey[900]),

      //For normal text
      bodyLarge: GoogleFonts.inter(fontSize: 18, color: Colors.black),
      bodyMedium: GoogleFonts.inter(fontSize: 16, color: Colors.black),
      bodySmall: GoogleFonts.inter(fontSize: 14, color: Colors.black),
    ),

    primarySwatch: const MaterialColor(
      0xFF0d67b5,
      <int, Color>{
        50: Color(0xFFb6d0f6),
        100: Color(0xFF8ba4ed),
        200: Color(0xFF6088e4),
        300: Color(0xFF375ce1),
        400: Color(0xFF1a40d8),
        500: Color(0xFF0d67b5), // This is your new primary color
        600: Color(0xFF0952a1),
        700: Color(0xFF07408c),
        800: Color(0xFF042e78),
        900: Color(0xFF021c63),
      },
    ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.green)
  );

  static ThemeData darkTheme = ThemeData(
    // brightness of the theme
    brightness: Brightness.dark,

    // app bar theme
    appBarTheme: const AppBarTheme(color: Color(0xFFba3800)),

    // elevated button theme
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,

    // floating action button theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFba3800),
    ),

    // text theme
    textTheme: TextTheme(
      //For large banner like text
      displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 245, 245, 245)),
      displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 245, 245, 245)),
      displaySmall: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 245, 245, 245)),

      //For normal text heading
      headlineLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),
      headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),
      headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),

      //For normal text
      titleLarge: GoogleFonts.inter(
          fontSize: 18, color: const Color.fromARGB(255, 245, 245, 245)),
      titleMedium: GoogleFonts.inter(
          fontSize: 16, color: const Color.fromARGB(255, 245, 245, 245)),
      titleSmall: GoogleFonts.inter(
          fontSize: 14, color: const Color.fromARGB(255, 245, 245, 245)),

      //For lables text
      labelLarge: GoogleFonts.inter(
          fontSize: 18, color: const Color.fromARGB(255, 236, 236, 236)),
      labelMedium: GoogleFonts.inter(
          fontSize: 16, color: const Color.fromARGB(255, 236, 236, 236)),
      labelSmall: GoogleFonts.inter(
          fontSize: 14, color: const Color.fromARGB(255, 236, 236, 236)),

      //For normal text
      bodyLarge: GoogleFonts.inter(fontSize: 18, color: Colors.white),
      bodyMedium: GoogleFonts.inter(fontSize: 16, color: Colors.white),
      bodySmall: GoogleFonts.inter(fontSize: 14, color: Colors.white),
    ),

    // primary text theme
    primaryTextTheme: TextTheme(
      //For large banner like text
      displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 245, 245, 245)),
      displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 245, 245, 245)),
      displaySmall: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 245, 245, 245)),

      //For normal text heading
      headlineLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),
      headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),
      headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 255, 255)),

      //For normal text
      titleLarge: GoogleFonts.inter(
          fontSize: 18,
          color: const Color.fromARGB(255, 245, 245, 245),
          fontWeight: FontWeight.w900),
      titleMedium: GoogleFonts.inter(
          fontSize: 16,
          color: const Color.fromARGB(255, 245, 245, 245),
          fontWeight: FontWeight.w900),
      titleSmall: GoogleFonts.inter(
          fontSize: 14,
          color: const Color.fromARGB(255, 245, 245, 245),
          fontWeight: FontWeight.w900),

      //For lables text
      labelLarge: GoogleFonts.inter(
          fontSize: 18, color: const Color.fromARGB(255, 236, 236, 236)),
      labelMedium: GoogleFonts.inter(
          fontSize: 16, color: const Color.fromARGB(255, 236, 236, 236)),
      labelSmall: GoogleFonts.inter(
          fontSize: 14, color: const Color.fromARGB(255, 236, 236, 236)),

      //For normal text
      bodyLarge: GoogleFonts.inter(fontSize: 18, color: Colors.white),
      bodyMedium: GoogleFonts.inter(fontSize: 16, color: Colors.white),
      bodySmall: GoogleFonts.inter(fontSize: 14, color: Colors.white),
    ),

    primarySwatch: const MaterialColor(
      0xFF0d67b5, // New primary color for dark mode
      <int, Color>{
        50: Color(0xFF021c63),
        100: Color(0xFF042e78),
        200: Color(0xFF07408c),
        300: Color(0xFF0952a1),
        400: Color(0xFF0d67b5), // This is your new dark primary color
        500: Color(0xFF1a40d8),
        600: Color(0xFF375ce1),
        700: Color(0xFF6088e4),
        800: Color(0xFF8ba4ed),
        900: Color(0xFFb6d0f6),
      },
    ),
  );
}
