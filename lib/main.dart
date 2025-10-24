import 'package:flutter/material.dart';
import 'package:untitled1/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart'; // 이 import를 추가해야 합니다.

void main() async { // main 함수를 비동기(async)로 변경합니다.

  // 로케일 데이터를 초기화합니다.
  // 이 작업을 완료할 때까지 기다립니다. (await)
  await initializeDateFormatting('ko_KR', null);

  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}