import 'package:flutter/material.dart';
import 'package:todo/utill/appcolors.dart';

class settings extends StatefulWidget {
static String route = "settings";

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
bool isDark= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
     children: [
       Row(
         children: [
           Padding(
             padding: EdgeInsets.only(left: 10),
             child: Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30
             ,color: AppColors.primary),),
           )
           ,Spacer(),
           Switch(value: isDark, onChanged: (value) {
             setState(() {
               isDark = value;
             });
           },activeColor: AppColors.primary,)
         ],
       )
     ],
      ),
    );
  }
}

PreferredSizeWidget buildAppBar() => AppBar(
  title: Padding(
    padding: EdgeInsets.only(left: 20),
    child: Text("Settings"),
  ),
);