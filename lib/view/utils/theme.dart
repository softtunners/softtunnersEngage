import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData engageTheme = _engageTheme();

ThemeData _engageTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: _engageThemeColorScheme(base.colorScheme),
    textTheme: _engageThemeTextTheme(base.textTheme),
    elevatedButtonTheme: _elevatedButtonTheme(base.elevatedButtonTheme),
    inputDecorationTheme: _engageInputTheme(base.inputDecorationTheme),
  );
}

// Color Scheme
ColorScheme _engageThemeColorScheme(ColorScheme base) => base.copyWith(
    primary: const Color(0xff0B4E82),
    // primary: Colors.white,
    onPrimary: const Color(0xffffffff),
    secondary: const Color(0xffFFBD3B),
    onSecondary: const Color(0xff000000),
    background: const Color(0xfff2f2f2),
    error: const Color(0xffcc0000),
    tertiary: Color.fromARGB(255, 167, 167, 167),
    onSurface: const Color(0xff0B0D17),
    surfaceTint: Color.fromARGB(20, 236, 248, 255));

// Text Theme
TextTheme _engageThemeTextTheme(TextTheme base) => base.copyWith(
      headline1: base.headline1!.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline2: base.headline2!.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      headline3: base.headline3!.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline4: base.headline4!.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      subtitle1: base.subtitle1!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      subtitle2: base.subtitle2!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      bodyText1: base.bodyText1!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      bodyText2: base.bodyText2!.copyWith(
        fontSize: 12,
        color: const Color(0xff57636C),
      ),
    );

// Elevated Button Theme
ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) => ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        minimumSize: const Size.fromHeight(50),
        backgroundColor: const Color(0xff0B4E82),
      ),
    );

// Input Theme
InputDecorationTheme _engageInputTheme(InputDecorationTheme base) => InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Color(0x00000000), width: 2),
        borderRadius: BorderRadius.circular(0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Color(0x00000000), width: 2),
        borderRadius: BorderRadius.circular(0),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Color(0x00000000), width: 2),
        borderRadius: BorderRadius.circular(0),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Color(0x00000000), width: 2),
        borderRadius: BorderRadius.circular(0),
      ),
      fillColor: const Color(0xFFECF8FF),
    );
