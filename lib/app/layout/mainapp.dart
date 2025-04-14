//

import 'package:flutter/material.dart';
import 'package:tj2024b_app/app/member/signup.dart';

class MainApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp>{
  // 1. 페이지 위젯 리스트 : 여러개의 위젯들을 갖는 리스트
    // Widget : 여러 위젯들을 상속하는 상위 위젯(클래스)
  List<Widget> pages = [
    Text("홈 페이지"),
    // Home(),
    Text("게시물1 페이지"),
    Text("게시물2 페이지"),
    Signup()
    // Text("내 정보 페이지"),
  ];
  // 2. 페이지 상단 제목 리스트
  List<String> pageTitle = ['홈','게시물1', '게시물2','내정보'];
  
  // 3. 현재 클릭된 페이지 번호 : 상태 변수
  int selectedIndex = 0; // 0:홈, 1:게시물1, 2:게시물2, 3:내정보


  @override
  Widget build(BuildContext context) {
    return Scaffold( // 레이아웃
      appBar: AppBar( // 상단메뉴
        title: Row(
          children: [ // 가로 배치할 하위 위젯
            // 이미지 삽입
            // 로컬이미지(플러터) / 네트워크이미지(스프링서버)
            // pubspex.yaml 파일에 아래와 같이 입력 -> 상단 pub get(새로고침)
            // flutter:
            //   assets:
            //     - assets/images/
            Image(
              image: AssetImage('assets/images/flutter_logo.png'),
              height: 50,
              width: 50,
            ),
            SizedBox(width: 20),
            Text(pageTitle[selectedIndex], style: TextStyle(color: Colors.orange)),
          ]
        ),
        backgroundColor: Colors.black,

      ),
      body: pages[selectedIndex], // 본문 : 현재 선택된 위젯들 보여주기


      bottomNavigationBar: BottomNavigationBar(
        // onTap : BottomNavigationBar에서 해당하는 버튼을 클릭했을 때 발생하는 이벤트 속성
          // (index) => 함수명(index) : index에는 선택된 인텍스 번호 반환
        onTap: (index) => setState(() {selectedIndex = index;}),
        currentIndex: selectedIndex, // 현재 선택된 버튼 번호
        type: BottomNavigationBarType.fixed, // 고정 크기 설정, 아이콘이 많아지면 자동으로 확대/축소

        unselectedItemColor: Colors.grey, // 기본 색상
        selectedItemColor: Colors.orange, // 선택된 색상
        


        items: [ // 여러개의 버튼 위젯들
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: '게시물1'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: '게시물2'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
        ],
        backgroundColor: Colors.black,

      ), // 하단메뉴
    );
  }
}
