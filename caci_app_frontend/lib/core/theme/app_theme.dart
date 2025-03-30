import 'package:flutter/material.dart';

class AppTheme {
  // Primary colors
  static const Color primaryBlue = Color.fromARGB(255, 18, 44, 241);
  static const Color primaryDarkBlue = Color.fromARGB(255, 10, 25, 150);
  
  // Secondary colors
  static const Color secondaryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryDarkColor = Color.fromARGB(255, 30, 30, 30);
  
  // Text colors
  static const Color lightTextColor = Colors.white;
  static const Color darkTextColor = Colors.black87;
  
  // Background colors
  static const Color lightBackgroundColor = Colors.white;
  static const Color darkBackgroundColor = Color.fromARGB(255, 18, 18, 18);

  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlue,
      titleTextStyle: TextStyle(
        color: lightTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: lightTextColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: lightTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: darkTextColor, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: darkTextColor, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: darkTextColor),
      bodyMedium: TextStyle(color: darkTextColor),
    ),
    colorScheme: ColorScheme.light(
      primary: primaryBlue,
      secondary: secondaryColor,
      onPrimary: lightTextColor,
      onSecondary: darkTextColor,
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: 1,
    ),
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryDarkBlue,
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDarkBlue,
      titleTextStyle: TextStyle(
        color: lightTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: lightTextColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryDarkBlue,
        foregroundColor: lightTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: lightTextColor, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: lightTextColor, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: lightTextColor),
      bodyMedium: TextStyle(color: lightTextColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: primaryDarkBlue,
      secondary: secondaryDarkColor,
      onPrimary: lightTextColor,
      onSecondary: lightTextColor,
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: 1,
    ),
  );
}
