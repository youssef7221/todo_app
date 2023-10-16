import 'package:flutter/material.dart';
import 'package:todo/firebase/firebasefunctions.dart';
import 'package:todo/screens/homescreen/bottomsheet.dart';
import 'package:todo/screens/models/tasksDm.dart';

import '../../utill/apptheme.dart';

class EditTask extends StatefulWidget {
  static String route = "Edit";
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TasksDm tasksDm = ModalRoute.of(context)!.settings.arguments as TasksDm;
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          height: MediaQuery.of(context).size.height * .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Edit Task",
                    textAlign: TextAlign.center,
                    style: AppTheme.todotextstyle
                        .copyWith(color: Theme.of(context).hintColor),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                child: TextFormField(
                  controller: descriptionTextEditingController,
                  decoration: InputDecoration(
                    hintText: "Enter Description",
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "select Date",
                style: AppTheme.todotextstyle
                    .copyWith(color: Theme.of(context).hintColor),
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
                        setState(() {
                          today = value!;
                        });
                      },
                    );
                  },
                  child: Text("${today.day} / ${today.month} / ${today.year}",
                      textAlign: TextAlign.center,
                      style: AppTheme.todotextstyle.copyWith(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w500))),
              SizedBox(
                height: 10,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      tasksDm.title = titleTextEditingController.text;
                      tasksDm.description =
                          descriptionTextEditingController.text;
                      tasksDm.date = DateUtils.dateOnly(today).microsecondsSinceEpoch;
                      titleTextEditingController.clear();
                      descriptionTextEditingController.clear();
                      FirebaseFunctions.updateTask(tasksDm)
                          .then((value) => Navigator.pop(context));
                    },
                    child: const Text("Edit Task")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
