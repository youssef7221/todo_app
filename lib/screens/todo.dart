import 'package:flutter/material.dart';

import 'homescreen/addlist.dart';
import 'homescreen/chooseday.dart';

class todo extends StatefulWidget {

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: buildAppBar(),
       body: Column(
          children: [
            chooseday(),
            Expanded(
                child: addlist()),
          ],
        )
    );
  }
}

PreferredSizeWidget buildAppBar() => AppBar(
  title: Padding(
    padding: EdgeInsets.only(left: 20),
    child: Text("To Do List"),
  ),
);