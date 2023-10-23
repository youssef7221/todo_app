import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen/edit_screen/edit_task.dart';
import 'package:todo/screens/homescreen/homescreen.dart';
import 'package:todo/screens/login_screen/login_screen.dart';
import 'package:todo/screens/provider/settings_provider.dart';
import 'package:todo/screens/settings/settings.dart';
import 'package:todo/screens/splash.dart';
import 'package:todo/utill/apptheme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => settingsprovider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
late settingsprovider provider ;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: provider.firebaseUser != null ? home.route : LoginScreen.route
        ,
  routes: {
        LoginScreen.route : (context) => LoginScreen(),
    home.route : (context) => home(),
    splash.route : (context) => const splash(),
    settings.route : (context) => settings(),
    EditTask.route : (context) => EditTask()
  },
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      themeMode: provider.currentmode
    );
  }
}
