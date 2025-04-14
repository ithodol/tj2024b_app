// * myapp.dart 레이아웃을 구성하는 파일
import 'package:flutter/material.dart';
import 'package:tj2024b_app/app/layout/mainapp.dart';

class MyApp extends StatelessWidget{ // 상태 없는 위젯
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 위젯명(key : value,key : value, key : value)
      // key : 위젯마다의 정해진 key를 사용
      // value : key 적합한 다양한 하위 위젯들이 들어간다
      title: "더조은앱", // 앱 탭 이름
      theme: ThemeData( // 앱 테마
        scaffoldBackgroundColor: Colors.white,
        // 전체 body text 스타일
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: MainApp(), // 앱 본문
    );
  }
}