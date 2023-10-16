import 'package:flutter/material.dart';
import 'package:todo/utill/appcolors.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    brightness: Brightness.light,
    cardColor: AppColors.dark,
      hintColor:Colors.black ,
    dividerTheme: DividerThemeData(thickness: 3),
    dividerColor: Colors.red,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        backgroundColor: AppColors.primary,
        elevation: 0.0),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: AppColors.accent,
  );
  static TextStyle todotextstyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static ThemeData darktheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0XFF060E1E)),
          backgroundColor: AppColors.primary,
          elevation: 0.0),
      primaryColor: AppColors.dark,
      scaffoldBackgroundColor: AppColors.accentdark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.dark,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.primary),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
      dividerTheme: DividerThemeData(thickness: 3),
      dividerColor: AppColors.primary,
      cardColor: Colors.grey,
       hintColor: Colors.white);
}
