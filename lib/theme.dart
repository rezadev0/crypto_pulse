import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static const Color _lightPrimaryColor = Colors.white;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static const Color _lightOnPrimaryColor = Colors.white;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.white;
  static const Color _lightIconColor = Colors.black;
  static const Color _darkPrimaryColor = Color(0xff191D2D);
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkOnPrimaryColor = Color(0xff2A2F45);
  static const Color _darkTextColorPrimary = Colors.white;
  static const Color _appbarColorDark = Color(0xff191D2D);
  static const Color _darkIconColor = Colors.white;

  // *****************
  // Text Style - light
  // *****************
  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyeTextStyle,
  );

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: const AppBarTheme(
        color: _appbarColorLight,
        iconTheme: IconThemeData(color: _lightIconColor)),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      primaryContainer: _lightPrimaryVariantColor,
    ),
    textTheme: _lightTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorLight),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: _lightIconColor,
      unselectedItemColor: _lightIconColor.withOpacity(0.5),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: _appbarColorDark,
      iconTheme: IconThemeData(color: _darkIconColor),
    ),
    colorScheme: const ColorScheme.dark(
      primary: _darkPrimaryColor,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryVariantColor,
    ),
    textTheme: _darkTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorDark),
  );
}
