import 'package:flutter/material.dart';
import 'package:untitled1/component/main_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea( // 시스템 UI 피해서 UI -
            child: Column( // 달력과 리스트를 세로로
                children: [
                  // 미리 작업해둔 달력 위젯 보여주기
                  MainCalendar(),
                ]
            )
        )
    );
  }
}