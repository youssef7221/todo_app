import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen/addlist.dart';
import 'package:todo/screens/homescreen/bottomsheet.dart';
import 'package:todo/screens/tasksDm.dart';
import 'package:todo/utill/appcolors.dart';
import 'package:todo/utill/apptheme.dart';
List<TasksDm> tasks = [
  TasksDm(todo: "Play BasketBall", Description: "Playing"),
  TasksDm(todo: "Play BasketBall", Description: "Playing"),
  TasksDm(todo: "Play BasketBall", Description: "Playing"),
  TasksDm(todo: "Play BasketBall", Description: "Playing"),
  TasksDm(todo: "Play BasketBall", Description: "Playing"),
  TasksDm(todo: "Play BasketBall", Description: "Playing"),
  TasksDm(todo: "Play BasketBall", Description: "Playing"),
  TasksDm(todo: "Play BasketBall", Description: "Playing"),


];
class home extends StatefulWidget {
  static String route = "home";
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildButtonNav(),
      floatingActionButton: BuildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: addlist(),
    );
  }
  Widget BuildFab() => FloatingActionButton(onPressed: (){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
      builder: (context) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: bottomsheet(),
      );
    },);
  },child: Icon(Icons.add), shape:const StadiumBorder(side: BorderSide(color: Colors.white, width: 4)
    ),
  );

  Widget buildButtonNav() => BottomAppBar(
    notchMargin: 5,
    shape: CircularNotchedRectangle(),
    clipBehavior: Clip.hardEdge,
    child: BottomNavigationBar(
    items: [
    BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_list.png")),label: ""),
    BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_settings.png")),label: "")
    ],

    ),
  );

  PreferredSizeWidget buildAppBar() => AppBar(
    title: Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text("To Do List"),
    ),
    toolbarHeight: 157,
  );
}
