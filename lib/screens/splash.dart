import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen/homescreen.dart';

class splash extends StatefulWidget {
  const splash({super.key});
  static String route = "splash";

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),
    () {
      Navigator.pushReplacementNamed(context, home.route);
    },);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/logo.png",alignment: Alignment.center,),
        ],
      ),
    );
  }
}
