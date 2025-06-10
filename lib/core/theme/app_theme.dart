import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// This class defines the app's theme using Material 3 design principles.
class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.light(
      primary: Color(0xFFf0f2ff),
      secondary: Colors.deepPurple,
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black87,
      onError: Colors.white,
    ),

    //Text theme using Google Fonts
    textTheme: TextTheme(
      titleLarge: GoogleFonts.sora().copyWith(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: GoogleFonts.sora().copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.sora().copyWith(fontSize: 20),
      bodyLarge: GoogleFonts.sora().copyWith(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.sora().copyWith(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.sora().copyWith(color: Colors.black, fontSize: 15),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      showSelectedLabels: true,
      selectedIconTheme: const IconThemeData(color: Colors.deepPurple),
      selectedLabelStyle: const TextStyle(color: Colors.white),
      selectedItemColor: Colors.white,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey[700],
      unselectedIconTheme: IconThemeData(color: Colors.grey[700]),
      unselectedLabelStyle: const TextStyle(color: Colors.white),
    ),

    //text form field
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.deepPurple.shade400, width: 2),
      ),
    ),
  );
}
