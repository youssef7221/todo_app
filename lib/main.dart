import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen/homescreen.dart';
import 'package:todo/screens/settings/settings.dart';
import 'package:todo/screens/splash.dart';
import 'package:todo/utill/apptheme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: home.route,
  routes: {
    home.route : (context) => home(),
    splash.route : (context) => splash(),
    settings.route : (context) => settings()
  },
      theme: AppTheme.themeDatalight,
    );
  }
}
