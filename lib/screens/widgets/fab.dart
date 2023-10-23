import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen/todo_tap/bottomsheet.dart';

class BuildFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){
      showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: bottomsheet(),
          );
        },);
    },
      child: Icon(Icons.add), shape:const StadiumBorder(side: BorderSide(color: Colors.white, width: 4)
      ),
    );
  }
}

