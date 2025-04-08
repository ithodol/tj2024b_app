// 플러터 : dart언어(google) 기반의 프레임워크
// dart언어 클래스 : 첫글자 대문자 시작
// dart언어 인스턴스생성 : 클래스명()
// 위젯 : 화면을 그려내는 최소의 단위 , 클래스기반(첫글자를 대문자)
// 위젯 사용법
  // 1. 위젯명 : 클래스명과 동일하게 첫글자가 대문자이다.
  // 2. ( ) : 클래스명뒤에 생성자 처럼 초기값 대입하는 매개변수 자리
    // java : new Member( "유재석" , 40 );
    // dart : Member( name : "유재석" , age : 40 );

// 위젯 안에 위젯 == 객체 안에 객체
  // 3. 위젯명( 속성명 : 위젯명( 속성명 : 위젯명() ) );
// 속성 : 각 위젯들이 정의한 속성명들이 존재한다. ( 매개변수명 )

  // 4. 위젯 트리 : 위젯 구조
/*
MyApp( StatelessWidget ) : 상태 없는 위젯(화면)
  -> build
    -> MaterialApp
      -> home
        -> Scaffold
          -> appBar
            -> AppBar
              -> Text
          -> body
            -> Text
          -> bottomNavigationBar
            -> BottomAppBar
              -> Text
*/
import 'package:flutter/material.dart';

void main(){
  print("콘솔 출력");
  // runApp(MyApp1());
  runApp(MyApp2());
  // runApp(클래스명())
}

// 2. 클래스 생성 / 상태가 없는 위젯 제공
class MyApp1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 뼈대
        home : Scaffold(// 레이아웃
          // 속성명 : 위젯명()
          appBar: AppBar(title : Text("상단메뉴")), // 상단메뉴
          body: Text("본문"), // 본문
          bottomNavigationBar: BottomAppBar(
            child: Text("하단메뉴"),
          ), // 하단메뉴

        )
    );
  }
}


// 3. 상태 없는 위젯이란 ? StatelessWidget : 고정된(불변) UI
class MyApp2 extends StatelessWidget{

  // 값 변수
  int count = 0;

  void increment(){
    count++;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 모든 위젯을 감싸는 뼈대 역할의 위젯
      home: Scaffold( // 레이아웃을 구성하는 위젯
        appBar: AppBar(title: Text("상단 txt"),), // 상단바 위젯
        body: Center( // 가로 가운데 정렬 위젯
          child: Column( // 세로 배치 위젯
            children: [
              Text("본문 txt : $count"), // 텍스트 위젯
              TextButton( // 텍스트 버튼 위젯
                  onPressed: increment,// onClick, 버튼 클릭했을 때
                  child: Text("버튼")
              )
            ]
          ), // 세로배치
        ), // 가운데 정렬
      ),
    );
  }
}
// Colum(chileren : [위젯1(), 위젯2(), 위젯3() ...]) : 세로 배치 