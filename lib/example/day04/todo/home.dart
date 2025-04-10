// 1. 상태 O 위젯 만들기


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState(){
    return _HomeState();
  }

}

// dart 에서는 클래스/변수 명 앞에 _(언더바) private 뜻함
class _HomeState extends State<Home>{
  // 1. dio 객체 생성
  Dio dio = Dio();

  // 2. 할 일 목록을 저장하는 리스트 선언
  List<dynamic> todoList = [];

  // 3. 자바와 통신하여 할 일 목록을 조회하는 함수 생성
  void todoFindAll() async{
    try{
      final response = await dio.get("http://192.168.40.45:8080/day04/todos");
      final data = response.data;
      // 조회 결과가 없으면 [] / 조회 결과가 있으면 [{}, {}, {} ...]

      // setState 이용하여 재랜더링
      setState(() {
        todoList = data; // 자바로부터 응답받은 결과를 상태변수에 저장
      });
      print(todoList);
    }catch(e){
      print(e);
    }
  }

  // 4. 화면이 최초로 열렸을 때 딱 한 번 실행
  @override
  void initState() {
    super.initState();
    todoFindAll(); // 해당 위젯이 최초로 열렸을 때 자바에게 할 일 목록 조회 함수 호출
  }

  // 5. 삭제 이벤트 함수
  void todoDelete(int id) async{
    try{
      final response = await dio.delete("http://192.168.40.45:8080/day04/todos?id=$id");
      final data = response.data;
      if(data == true){
        todoFindAll(); // 삭제 성공시 할 일 목록 호출
      }
    }catch(e){
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("킹호돌의 TODO"),),
      body: Center(
        child: Column(
          children: [
            // (1) 등록 화면으로 이동하는 버튼
            TextButton(
                onPressed: () => {Navigator.pushNamed(context, "/write")},
                child: Text("할 일 추가")
            ),

            // (2) 간격
            SizedBox(height: 30,),

            // (3) ListView 이용한 할 일 목록 출력
            // 자바로부터 가져온 할 일 목록을 map 함수를 이용하여 반복해서 Card 형식의 위젯 만들기
            Expanded( // Column 위젯 안에서 ListView 사용시 Expanded 위젯 안에서 사용
                child: ListView( // (<ol>) ListView : 높이 100%의 자동 스크롤 지원
                  // children : [] / []대신 map 반복문
                  children: todoList.map( (todo) {
                    return Card(
                        child: ListTile(
                        title: Text(todo['title']), // 제목
                        subtitle: Column(
                          children: [ // dart 언어에서 문자와 변수를 출력하는 방법
                            // [방법1] 변수값만 출력할 경우 : "문자열 $변수명"
                            // [방법2] 변수안에 key의 값을 출력할 경우 : "문자열 ${객체변수['key']}"
                              // {key : value, key : value, key : value}
                            Text("내용 : ${todo['content']}"),
                            Text("상태 : ${todo['done'] ? '완료' : '미완료'}"),
                            Text("등록일자 : ${todo['createDateTime'].split('T')[0]}")
                          ],
                        ),
                        // trailing : ListTile 오른쪽 끝에 표시되는 위젯
                          // IconButton
                            trailing : Row( // 하위 위젯들을 가로 배치 vs Column
                              mainAxisSize : MainAxisSize.min , // Row 배치 방법 , 오른쪽 위젯들의 넓이를 자동으로 최소 크기 할당
                              children: [ // Row 위젯의 자식 들
                                IconButton( onPressed: () => { Navigator.pushNamed(context, "/update" , arguments : todo['id'] ) } , icon: Icon(Icons.edit) ) ,
                                IconButton( onPressed: () => { Navigator.pushNamed(context , "/detail" , arguments : todo['id'] ) }, icon: Icon(Icons.info) , ) ,
                                IconButton( onPressed: () => { todoDelete( todo['id'] ) } , icon: Icon( Icons.delete ) ),
                              ],
                            )
                        ) // ListTtile end
                    ); // ;(세미콜론) return 마다

                  }).toList(), // map 결과를 toList() 함수를 이용하여 List 타입으로 변환
                )
            )
          ],
        ),
      )
    );
  }

}