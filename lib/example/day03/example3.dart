// 상태 위젯 + Rest 통신

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 1. main 함수
void main(){
  runApp(MyApp());
}
// 2. 상태 관리 클래스 선언
  // StatefulWidget 상속받으면 꼭! createState()로 재정의 해야함
class MyApp extends StatefulWidget{
  // - 상태 위젯과 연결
  // [방법1]
    // MyAppState createState(){
    //   return MyAppState();
    // }

  // [방법2]
    MyAppState createState() => MyAppState();

}

// 3. 상태 위젯 클래스 선언 / 상태를 만들고 상태를 관리할 수 있는 상태 위젯 만들기
class MyAppState extends State<MyApp>{

  // * 상태 변수
  String responseText = "서버 응답 결과가 표시되는 곳";

  Dio dio = Dio(); // Dio 객체 생성
  // dio 라이브러리를 이용한 REST 통신하는 함수
  void todoSend() async{
    try{
      // 샘플 데이터
      final sendData = {"title" : "운동하기", "content" : "d", "done" : "false" };

      final response = await dio.post("http://192.168.40.45:8080/day04/todos", data : sendData); // dio를 이용하여 post
      final data = response.data; // 응답에서 bodt(본문) 결과만 추출
      // 응답 결과를 상태에 저장 / setState() 함수를 이용한 상태 랜더링
      setState(() {
        responseText = "응답 결과 : $data"; // 상태 변수에 새로운 값 대입
      });

    }catch(e){
      print(e);
      setState(() {
        responseText = "에러발생 : $e";
      });
    }
  }

  dynamic todoList = [];
  void todoGet() async{
    try{
      final response = await dio.get("http://192.168.40.45:8080/day04/todos");
      final data = response.data;
      print(data);
      // 응답 결과를 상태 변수에 대입 / setState()
      setState(() {
        todoList = data;
      });
    }catch(e){
      print(e);
    }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(responseText),
              TextButton(
                  onPressed: todoSend,
                  child: Text("자바통신")
              ),
              TextButton(
                  onPressed: todoGet,
                  child: Text("자바통신2")
              )
            ],
          )
        ),
      ),
    );
  }
}
