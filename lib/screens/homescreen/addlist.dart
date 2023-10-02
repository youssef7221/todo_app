import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../utill/appcolors.dart';
import '../../utill/apptheme.dart';
import 'homescreen.dart';

class addlist extends StatefulWidget {
  const addlist({super.key});

  @override
  State<addlist> createState() => _addlistState();
}

class _addlistState extends State<addlist> {
  @override
  bool Istrue = true;
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder:(context, index){
      return Container(
        margin: EdgeInsets.all(20),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: .25,
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.circular(20),
              )
            ],
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * .13,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(

              children: [
                Container(margin: EdgeInsets.symmetric(vertical: 10),
                    child: VerticalDivider(thickness: 3,color: Colors.red,)),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tasks[index].todo,style: AppTheme.todotextstyle,),
                    Text(tasks[index].Description,style: AppTheme.todotextstyle,)
                  ],
                ),
                Spacer(),
                Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                      decoration: BoxDecoration(
                          color: Istrue == true? AppColors.primary : Colors.green,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: ImageIcon(AssetImage("assets/images/icon_check.png"),color: Colors.white,)),
              ],
            ),
          ),
        ),
      );
    },
      itemCount: tasks.length,);
  }
}