import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/screens/homescreen/edit_task.dart';

import '../../firebase/firebasefunctions.dart';
import '../../utill/appcolors.dart';
import '../../utill/apptheme.dart';
import '../models/tasksDm.dart';

class TodoTap extends StatefulWidget {
  @override
  State<TodoTap> createState() => _TodoTapState();
}

class _TodoTapState extends State<TodoTap> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                  ),
                ),
                CalendarTimeline(
                  initialDate: selectedDay,
                  firstDate: DateTime(2022, 12, 31),
                  lastDate: DateTime(2025, 12, 31),
                  leftMargin: 20,
                  monthColor: Theme.of(context).cardColor,
                  dayColor: Theme.of(context).cardColor,
                  activeDayColor: Theme.of(context).cardColor,
                  activeBackgroundDayColor: Theme.of(context).primaryColor,
                  dotsColor: AppColors.transparent,
                  locale: 'en_ISO',
                  onDateSelected: (date) {
                    selectedDay = date;
                    setState(() {});
                  },
                ),
              ],
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot<TasksDm>>(
              stream: FirebaseFunctions.gettasks(selectedDay),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something is wrong"),
                  );
                }
                var task =
                    snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(12),
                      child: Slidable(
                        startActionPane: ActionPane(
                          extentRatio: .5,
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                FirebaseFunctions.deleteTask(task[index]);
                                setState(() {});
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                              borderRadius: BorderRadius.circular(20),
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                Navigator.pushNamed(context, EditTask.route,arguments: task[index]);
                              },
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                              borderRadius: BorderRadius.circular(20),
                            )
                          ],
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .13,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: VerticalDivider(
                                    thickness: 3,
                                    color: Theme.of(context).dividerColor,
                                  )),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      task[index].title,
                                      style: AppTheme.todotextstyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      task[index].description,
                                      style: AppTheme.todotextstyle.copyWith(
                                          color: Theme.of(context).hintColor, fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  FirebaseFunctions.updateIsdone(task[index], true);
                                  setState(() {});
                                },
                                child: Container(
                                    margin: EdgeInsets.all(20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 6),
                                    decoration: BoxDecoration(
                                        color: task[index].isDone
                                            ? Colors.green
                                            : AppColors.primary,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: task[index].isDone
                                        ? Text("Done")
                                        : ImageIcon(
                                            AssetImage(
                                                "assets/images/icon_check.png"),
                                            color: Colors.white,
                                          )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: task.length,
                );
              },
            )),
          ],
        ));
  }
}

PreferredSizeWidget buildAppBar() => AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text("To Do List"),
      ),
    );
