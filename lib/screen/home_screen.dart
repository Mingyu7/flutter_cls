import 'package:flutter/material.dart';
import 'package:untitled1/component/main_calendar.dart';


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
      body: SafeArea( // 시스템 UI 피해서 UI 표시
        // ------------------------------------------------
        // 수정: 전체 화면을 SingleChildScrollView로 감싸서 오버플로우를 방지
        child: SingleChildScrollView(
          child: Column( // 달력과 리스트를 세로로 배치
            children: [
              // 미리 작업해둔 달력 위젯 보여주기
              MainCalendar(
                selectedDate: selectedDate, // 선택 날짜 전달
                onDaySelected: onDaySelected, // 날짜 선택 시 실행할 함수 전달
              ),

              // 향후 리스트 위젯 등이 들어갈 공간 (임시 텍스트)
              // Column 내부에 고정 높이 위젯만 있다면 Expanded는 필요하지 않지만,
              // 리스트 뷰를 추가할 경우를 대비하여 Flexible하게 만들어줍니다.
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '여기에 일정 리스트가 표시됩니다.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // ------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}