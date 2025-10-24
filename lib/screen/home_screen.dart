import 'package:flutter/material.dart';
import 'package:untitled1/component/main_calendar.dart';
import 'package:untitled1/component/schedule_card.dart'; // ScheduleCard 위젯을 가져옵니다.

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 현재 시간대의 날짜만 가져와 초기화합니다. UTC 강제는 불필요할 수 있습니다.
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    // 날짜 선택될 때마다 실행할 함수
    setState(() {
      this.selectedDate = selectedDate; // 선택 날짜 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // 시스템 UI 피해서 UI 표시
        // ------------------------------------------------
        // 수정: 전체 화면을 SingleChildScrollView로 감싸서 오버플로우를 방지
        child: SingleChildScrollView(
          child: Column(
            // 달력과 리스트를 세로로 배치
            children: [
              // 미리 작업해둔 달력 위젯 보여주기
              MainCalendar(
                selectedDate: selectedDate, // 선택 날짜 전달
                onDaySelected: onDaySelected, // 날짜 선택 시 실행할 함수 전달
              ),

              ScheduleCard(startTime: 12, endTime: 14, content: '일정 내용'),
              // ------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
