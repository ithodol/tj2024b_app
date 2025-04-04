import 'package:flutter/material.dart';
import 'package:tj2024b_app/main.dart';

void main(){ // 프로그램 진입점
  // (방법1) 메뉴 상단 'select device' 에서 'web' 선택 후 실행
  // (방법2) 'Device Manager' 해당 디바이스 실행
          // 메뉴 상단 'select device' 에서 실행된 디바이스(mobile) 선택 후 실행
  runApp(MyApp2());  // runApp(출력할클래스());

}

// (1) 간단한 화면 만들기, class 클래스명 extents StatelessWidget{ }
// StatelessWidget : 상태가 없는 인터페이스
  // -> build 추상 메소드 : 하나의 추상 메소드를 제공함
class MyApp1 extends StatelessWidget{
  // 컨트롤 + 스페이스바 : build 함수 재정의(오버라이딩)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Text("공포영화 못 보는 쫄보 1 깜짝놀래키면 열받ㄷㅇ음 쟤가 메인 귀신이야? "));
  }
}


// (2) 간단한 레이아웃 화면 만들기
class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: Scaffold());
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("여기는 상단 메뉴")), // 상단 메뉴바
          body: Center(child: Text("여기는 본문")), // 본문
          bottomNavigationBar: BottomAppBar(child: Text("여기는 하단 메뉴"),) // 하단 메뉴
        ) 
    );
  } // f end
} // class end