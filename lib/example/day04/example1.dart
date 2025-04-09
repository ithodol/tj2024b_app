// 위젯명 : 화면을 그려내는 최소 단위
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  // runApp(최초실행할위젯);
  runApp(
      MaterialApp(
        initialRoute: "/", // 최초로 실행했을 때 열리는 경로 설정
        // routes: {"경로정의" : (context) => 위젯명(), "경로정의" : (context) => 위젯명()},
        routes: {
          "/" : (context) => Home(),
          "/page1" : (context) => Page1(),
        },

      )
  );
} // main end


// 2. 앱 화면 만들기
// (선택1) StatelessWidget 상태 O / (선택2) StatefulWidget 상태 X
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home 헤더"),),
      body: Center(
        child: Column(
          children: [
            Text("Home 본문"),
            TextButton(onPressed: () => {Navigator.pushNamed(context, "/page1")},
                child: Text("page1 이동")
            ),
          ],
        ),
      )
    );
  }
} // home class end


// 2-1. 앱 화면 만들기 2
// (선택1) StatelessWidget 상태 O / (선택2) StatefulWidget 상태 X
class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page1 헤더"),),
      body: Center(child: Text("Page1 본문"),),
    );
  }
} // page1 class end











