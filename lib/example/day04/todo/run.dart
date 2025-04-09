import 'package:flutter/material.dart';
import 'package:tj2024b_app/example/day04/todo/Home.dart';
import 'package:tj2024b_app/example/day04/todo/write.dart';
// 1. main 함수 이용한 앱 실행
void main(){
  runApp(MyApp()); // 라우터를 갖는 위젯의 최초 화면
} // main end

// 2.
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/", // 앱이 실행됐을 때 최초 경로 설정
      routes: {
        "/" : (context) => Home(), // "/" 해당 경로를 호출하면 Home 위젯 열림
        "/write" : (context) => Write(),
        // "/update" : (context) => Update(),
      },
    );
  }
} // MyApp class end

