import 'package:flutter/material.dart';
import 'package:todo/screens/widgets/textfield.dart';
import 'package:todo/utill/apptheme.dart';

class bottomsheet extends StatefulWidget {
  @override
  State<bottomsheet> createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: AppTheme.todotextstyle.copyWith(color: Colors.black),
              )),
          textfield(hint: "Enter Task"),
          SizedBox(
            height: 10,
          ),
          textfield(
            hint: "Enter description",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "select Date",
            style: AppTheme.todotextstyle.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: (){
           showDatePicker(context: context, initialDate: DateTime.now(),
               firstDate: today,
               lastDate: DateTime(2025, 12, 31)
           ).then((value) {
             setState(() {
               today = value! ;
             });
           },);

              }, child: Text( "${today.day} / ${today.month} / ${today.year}",
              textAlign: TextAlign.center,
              style: AppTheme.todotextstyle
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500))),
          SizedBox(
            height: 10,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(onPressed: () {

            }, child: Text("ADD")),
          )
        ],
      ),
    );
  }
}
