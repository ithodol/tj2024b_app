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
  // *  dio 라이브러리 이용하여 REST 통신 하는 함수
  //dynamic todoList = []; // 빈 리스트 선언
  List< dynamic > todoList = [];
  // dynamic , List<dynamic> , * List<Map<String,dynamic> *

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

  // ** 위젯을 실행했을 때 최초로 1번 실행
  @override
  void initState() {
    super.initState();
    todoGet(); // 모든 할 일 목록 가져오기 함수 실행
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(responseText), // 텍스트 위젯
              TextButton( // 버튼 위젯
                  onPressed: todoSend,
                  child: Text("자바통신")
              ),
              TextButton( // 버튼 위젯
                  onPressed: todoGet,
                  child: Text("자바통신2")
              ),
              Expanded( // 확장위젯 - Expanded : colum에서 남은 공간 모두를 채워주는 위젯
                child: ListView( // Listview 위젯 : 스크롤이 가능한 목록 (주의:부모요소의 100% 높이 사용)

                    // 샘플
                  // children: [ // ListTitle : 목록에 대입할 항목 위젯
                  //   ListTile(title : Text("플러터"), subtitle: Text("1") ),
                  //   ListTile(title : Text("다트"), subtitle: Text("2") ),
                  //   ListTile(title : Text("파이썬"), subtitle: Text("3") )
                  // ],


                  // * 상태 변수에 있는 모든 값들을 반복문을 이용하여 출력 *

                    // [방법1] 일반 for문
                  // children: [
                  //   for(int index = 0; index < todoList.length; index++) // 상태 변수에 저장된 할 일 목록 순회
                  //     ListTile(title : Text(todoList[index]['title'])) // index 번재의 할 일 제목을 ListTitle 위젯에 Text 대입
                  // ],


                    // [방법2] .map
                  // 각 리스트/배열 의 요소들을 하나씩 순회하여 새로운 리스트/배열을 반환
                  children: todoList.map((todo) { // [] X ---> map 자체가 리스트라서 필요없음
                      return ListTile(title: Text(todo['title']), subtitle: Text(todo['content']));
                    }).toList() // 리스트명.map(반복변수명){return 위젯명;}).toList()
                  // dynamic todoList = [] ---> map 에서는 오류 발생함 / List 타입이 아니라서 map 작동 불가.
                  // List<dynamic> todoList = [] ---> map에서 정상 작동

                )
              ),
            ],
          )
        ),
      ),
    );
  }
}
