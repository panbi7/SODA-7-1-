import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // 앱의 진입점. MyApp 위젯 실행
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpansionPanelExample(), // ExpansionPanelExample 화면을 표시
    );
  }
}

class ExpansionPanelExample extends StatefulWidget {
  @override
  _ExpansionPanelExampleState createState() =>
      _ExpansionPanelExampleState(); // 상태를 가지는 위젯 생성
}

class _ExpansionPanelExampleState extends State<ExpansionPanelExample> {
  // 패널의 상태를 관리하기 위한 데이터 리스트
  final List<Map<String, dynamic>> _data = [
    {'header': '패널 1', 'body': '패널 1 내용입니다.', 'isExpanded': false},
    {'header': '패널 2', 'body': '패널 2 내용입니다.', 'isExpanded': false},
    {'header': '패널 3', 'body': '패널 3 내용입니다.', 'isExpanded': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanel 예제'), // 상단 앱바 제목
      ),
      body: SingleChildScrollView(
        // 스크롤 가능하도록 구현
        child: ExpansionPanelList(
          // 패널이 열리고 닫힐 때 호출되는 콜백 함수
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index]['isExpanded'] = !_data[index]['isExpanded'];
            });
          },
          // 데이터 리스트를 ExpansionPanel로 매핑하여 생성
          children: _data.map<ExpansionPanel>((Map<String, dynamic> item) {
            return ExpansionPanel(
              // 패널의 헤더 부분 정의
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item['header']), // 헤더에 표시될 텍스트
                );
              },
              // 패널이 확장되었을 때 표시될 내용 정의
              body: ListTile(
                title: Text(item['body']), // 본문 텍스트
                subtitle: Text('이것은 추가 설명입니다.'), // 부가적인 설명 텍스트
              ),
              isExpanded: item['isExpanded'], // 현재 패널의 열림 상태 지정
            );
          }).toList(), // 모든 데이터를 패널로 변환
        ),
      ),
    );
  }
}
