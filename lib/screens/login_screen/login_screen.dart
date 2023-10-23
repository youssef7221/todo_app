import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/login_screen/login_tap.dart';
import 'package:todo/screens/login_screen/reigister_tap.dart';
import 'package:todo/screens/provider/settings_provider.dart';
import 'package:todo/utill/apptheme.dart';

class LoginScreen extends StatelessWidget {
  static String route = "Login" ;
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("To Do App"),
          bottom: TabBar(
              indicatorColor: Theme.of(context).hintColor,
              tabs: [
            Text("Log In" , style: AppTheme.todotextstyle.copyWith(
              color: Theme.of(context).hintColor
            ),),
            Text("Sign Up", style:AppTheme.todotextstyle.copyWith(
                color: Theme.of(context).hintColor
            ),)
          ]),
        ),
        body: TabBarView(children: [
          LoginTab(),
        RegisterTab()
        ]),
      ),
    );
  }
}
