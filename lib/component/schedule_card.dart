import 'package:flutter/material.dart';
import '../const/colors.dart'; // colors.dart 파일의 경로를 가정했습니다.

// --------------------------------------------------------
// 1. ScheduleCard 위젯 (전체 구조)
// --------------------------------------------------------
class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;

  const ScheduleCard({
    required this.startTime,
    required this.endTime,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: PRIMARY_COLOR,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight( // 높이를 내부 위젯들의 최대 높이로 설정
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Time( // 시작과 종료 시간을 보여줄 위젯
                startTime: startTime,
                endTime: endTime,
              ),
              const SizedBox(width: 16.0),
              _Content( // 일정 내용을 보여줄 위젯
                content: content,
              ),
              const SizedBox(width: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}


// --------------------------------------------------------
// 2. _Time 위젯 (시간 표시 - StatefulWidget)
// --------------------------------------------------------
class _Time extends StatefulWidget {
  final int startTime; // 시작 시간
  final int endTime; // 종료 시간

  const _Time({required this.startTime, required this.endTime, Key? key})
      : super(key: key);

  @override
  State<_Time> createState() => _TimeState();
}

class _TimeState extends State<_Time> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: PRIMARY_COLOR,
      fontSize: 16.0,
    );

    return Column(
      // 시간을 위에서 아래로 배치
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // 시작 시간이 두 자릿수가 아니면 0으로 채워주기
          '${widget.startTime.toString().padLeft(2, '0')}:00',
          style: textStyle,
        ),
        Text(
          // 종료 시간이 두 자릿수가 아니면 0으로 채워주기
          '${widget.endTime.toString().padLeft(2, '0')}:00',
          style: textStyle.copyWith(fontSize: 10.0),
        ),
      ],
    );
  }
}


// --------------------------------------------------------
// 3. _Content 위젯 (내용 표시 - StatefulWidget)
// --------------------------------------------------------
// _Time 위젯 바로 아래에 작성
class _Content extends StatefulWidget {
  final String content; // 내용

  const _Content({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return Expanded( // 최대한 넓게 늘리기
      child: Text(
        widget.content, // widget.content로 접근
      ),
    );
  }
}