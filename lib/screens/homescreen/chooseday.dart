import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/utill/appcolors.dart';

class chooseday extends StatelessWidget {
  const chooseday({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
        ),
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025, 12, 31),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black,
          activeDayColor: Colors.black,
          activeBackgroundDayColor: Colors.white,
          dotsColor: AppColors.transparent,
          selectableDayPredicate: (date) => date.weekday!=DateTime.friday,
          locale: 'en_ISO',
        ),
      ],
    );
  }
}
