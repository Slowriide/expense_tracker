import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.light(
      primary: Colors.deepPurple,
      secondary: Colors.amber,
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black87,
      onError: Colors.white,
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
  );
}
