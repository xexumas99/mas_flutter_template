import 'package:flutter/material.dart';

ThemeData get themeData => ThemeData(
      bottomNavigationBarTheme: _bottomNavigationBarThemeData,
      appBarTheme: _appBarTheme,
      primaryColor: const Color(0xff0C3866),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme(
        primary: Color(0xff0C3866),
        primaryContainer: Color(0xff0C3866),
        secondary: Color(0xff007CC0),
        secondaryContainer: Color(0xff007CC0),
        surface: Colors.blueGrey,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Color(0xff007CC0),
        onError: Colors.red,
        brightness: Brightness.light,
      ),
    );

BottomNavigationBarThemeData get _bottomNavigationBarThemeData =>
    const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff007CC0),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
    );

AppBarTheme get _appBarTheme => const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Color(0xff0C3866),
      ),
      elevation: 1,
      actionsIconTheme: IconThemeData(
        color: Color(0xff0C3866),
      ),
      iconTheme: IconThemeData(
        color: Color(0xff0C3866),
      ),
    );
