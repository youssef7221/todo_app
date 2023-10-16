import 'package:flutter/material.dart';
import 'package:todo/firebase/firebasefunctions.dart';
import 'package:todo/screens/models/tasksDm.dart';
import 'package:todo/utill/apptheme.dart';
import 'package:firebase_core/firebase_core.dart';
class bottomsheet extends StatefulWidget {
  @override
  State<bottomsheet> createState() => _bottomsheetState();
}
TextEditingController titleTextEditingController = TextEditingController();
TextEditingController descriptionTextEditingController = TextEditingController();
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            child: TextFormField(
              controller: titleTextEditingController,
              decoration: InputDecoration(
                hintText: "Enter title",
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            child: TextFormField(
              controller:descriptionTextEditingController,
              decoration: InputDecoration(
                hintText: "Enter Description",
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "select Date",
            style: AppTheme.todotextstyle.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: today,
                        lastDate: DateTime(2025, 12, 31))
                    .then(
                  (value) {
                    setState((){
                      today = value!;
                    });
                  },
                );
              },
              child: Text("${today.day} / ${today.month} / ${today.year}",
                  textAlign: TextAlign.center,
                  style: AppTheme.todotextstyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500))),
          SizedBox(
            height: 10,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child:
                ElevatedButton(onPressed: () {
                  TasksDm tasks = TasksDm(title: titleTextEditingController.text,
                      description: descriptionTextEditingController.text,
                      date: DateUtils.dateOnly(today).microsecondsSinceEpoch);
                  FirebaseFunctions.addtask(tasks).then((value) {
                    Navigator.pop(context);
                  }
                  );
                  titleTextEditingController.clear();
                  descriptionTextEditingController.clear();
                }, child: const Text("Add Task")),
          )
        ],
      ),
    );
  }
}
