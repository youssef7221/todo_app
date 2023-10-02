import 'package:flutter/material.dart';
import 'package:todo/utill/appcolors.dart';

class AppTheme {
static ThemeData themeDatalight = ThemeData(
appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
    ),
  backgroundColor: AppColors.primary,
),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.accent,
);
static TextStyle todotextstyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
);
}