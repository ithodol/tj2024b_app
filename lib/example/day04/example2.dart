
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tj2024b_app/example/day03/example3.dart';

// 1. 시작점
void main(){
  runApp(MyApp());
} // main end

// 2-1. 상태 O 화면 선언
class MyApp extends StatefulWidget{
  MyAppState createState() => MyAppState();

} // MyApp class end

// 2-2
class MyAppState extends State<MyApp>{
  // 1. 입력 컨트롤러를 이용한 입력값들을 제어 / TextEditingController();
  // 2. 생성한 입력 컨트롤러 객체를 대입한다 / TextField(controller: 입력컨트롤러객체)
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  // 3. 입력값 추출 / 입력값컨트롤러객체.text

  void onEvent(){
    print(controller1.text);
    print(controller2.text);
    print(controller3.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title : Text("입력화면헤더"),),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30), // 빈 공간 위젯(여백 역할)

              Text("아래 내용을 입력 하세요"), // 텍스트 출력 위젯
              SizedBox(height: 30),

              TextField(controller: controller1), // 텍스트 입력 위젯
              SizedBox(height: 30),

              TextField(maxLength: 30, controller: controller2), // 최대 길이 설정
              SizedBox(height: 30),

              TextField(
                  maxLines: 5,
                  controller: controller3, // 최대 줄 설정
                  decoration: InputDecoration(labelText: "어어어어"),  
              ),
              SizedBox(height: 30),

              TextButton( // 텍스트 이벤트 버튼
                  onPressed: onEvent,
                  child: Text("클릭시 입력값을 출력합니다")
              )
            ],
          ),
        )
      ),
    );
  }
} // MyAppState clss end