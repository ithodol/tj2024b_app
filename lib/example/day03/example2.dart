/*
  // 상태 X : StatelessWidget
        한 번 출력된 화면은 불변(고정) / 재랜더링 X
          ---> 한 번 그래낸 화면은 고정
        사용법
          class 새로운위젯명 extends StatelessWidget{

          }

  // 상태 O : StatefulWidget, 재랜더링(새로고침)
        한 번 출력된 화면은 고정 / setState() 함수를 이용하여 재랜더링 O
        반드시 상태를 관리하는 별도의 클래스가 필요함
        ---> 한 번 그려낸 화면을 상태 변화에 따라 다시 그려내기 가능

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  // 3. 상태를 관리하는 위젯 실행
  runApp(MyApp1());
}

// 1. 상태를 관리하는 클래스(위젯) 선언 / StatefulWidget 클래스 상속받아서 상태관리 클래스를 만든다
class MyApp1 extends StatefulWidget{
  // ** 상태를 사용할 위젯과 연결, createState()
  MyApp1State createState() => MyApp1State();
}

// 2. 상태를 사용하는 클래스(위젯) 선언
class MyApp1State extends State<MyApp1>{
  int count = 0;
  void increment(){
    // count++;
    // print(count);
    // 상태 변화에 따른 재랜더링 setState((){})
    setState(() {
      count++;
    });
  }
  // initState
  // 상태 위젯이 최초로 실행될 때 딱 한번 실행되는 함수
      // 리액트의 useEffect( () => {}, {} ) 와 같음
  @override
  void initState() {
    print("initState 테스트");
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("상단바"),),
        body: Center(
          child: Column(
            children: [
              Text("count : $count"),
              TextButton(
                  onPressed: increment,
                  child: Text("클릭시 count 증가")
              )
            ]
          ),
        ),
      ),
    );
  }
}