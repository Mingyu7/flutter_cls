import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime(1800, 1, 1), // 1 첫째 날
      lastDay: DateTime(3000, 1, 1), // 2 마지막 날
      focusedDay: DateTime.now(), // 3 화면에 보여지는 날
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
      ),
    );
  }
}
