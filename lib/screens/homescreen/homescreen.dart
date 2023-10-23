import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen/todo_tap/bottomsheet.dart';
import 'package:todo/screens/settings/settings.dart';
import 'package:todo/screens/models/tasksDm.dart';
import 'package:todo/screens/widgets/bottomnav.dart';
import 'package:todo/screens/widgets/fab.dart';

import 'todo_tap/todo.dart';

List<Widget> taps = [TodoTap(), settings()];

class home extends StatefulWidget {
  static String route = "home";

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[index],
      bottomNavigationBar: buildButtonNav(),
      floatingActionButton: BuildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildButtonNav() => BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_list.png")),
                label: ""),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_settings.png")),
                label: "")
          ],
        ),
      );
}
