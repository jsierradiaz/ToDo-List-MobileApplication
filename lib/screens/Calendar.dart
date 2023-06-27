import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar_screen extends StatefulWidget {
  const Calendar_screen({super.key});

   @override
  State<Calendar_screen> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar_screen> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
      children: [
        Text("Calendar"),
        Container(
          child: TableCalendar(
            headerStyle: HeaderStyle(titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16), 
            lastDay: DateTime.utc(2030, 3, 10),
            onDaySelected: _onDaySelected,
          ),

        ),
      ],
      ),
    );
  }

}