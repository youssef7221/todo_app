import 'package:flutter/material.dart';
import 'package:todo/screens/homescreen/homescreen.dart';
import 'package:todo/screens/tasksDm.dart';

class textfield extends StatelessWidget {
  textfield({required this.hint});
  String hint = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 15),
      child: TextFormField(
   decoration: InputDecoration(
       hintText: hint,
   )
       , textInputAction: TextInputAction.next,),
    );
  }
}
