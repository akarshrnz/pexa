import 'package:flutter/material.dart';
import 'package:pexa_carcare_test/core/theme/custom_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: CustomColors.primaryColor,
      secondary: CustomColors.secondaryColor,
      onSurface: CustomColors.accentColor,
      background: CustomColors.backgroundColorLight,
      error: CustomColors.errorColor,
    ),
    scaffoldBackgroundColor: CustomColors.backgroundColorLight,
    appBarTheme: const AppBarTheme(
      surfaceTintColor:CustomColors.backgroundColorLight ,
      
      color: CustomColors.backgroundColorLight,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.black), 
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      headline2: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
      subtitle1: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16),
      bodyText1: TextStyle(color: Colors.black54, fontSize: 14),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(CustomColors.primaryColor),
      trackColor: MaterialStateProperty.all(CustomColors.secondaryColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: CustomColors.primaryColor,
      secondary: CustomColors.secondaryColor,
      onSurface: CustomColors.accentColor,
      background: CustomColors.backgroundColorDark,
      error: CustomColors.errorColor,
    ),
    scaffoldBackgroundColor: CustomColors.backgroundColorDark,
    appBarTheme: const AppBarTheme(
      color: CustomColors.backgroundColorDark,
      surfaceTintColor: CustomColors.backgroundColorDark,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white), 
    ),
    iconTheme: const IconThemeData(color: Colors.white), 
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      headline2: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      subtitle1: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 16),
      bodyText1: TextStyle(color: Colors.white70, fontSize: 14),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(CustomColors.primaryColor),
      trackColor: MaterialStateProperty.all(CustomColors.secondaryColor),
    ),
  );
}
