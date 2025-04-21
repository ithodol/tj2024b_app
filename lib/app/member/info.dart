import 'package:flutter/material.dart';

class Info extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InfoState();
  }
}

class _InfoState extends State<Info>{
  // 1. 상태변수
  int mno = 0;
  String memail = "";
  String mname = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원번호 : $mno "),
            SizedBox(height: 20),
            Text("아이디(이메일) : $memail"),
            SizedBox(height: 20),
            Text("이름(닉네임) : $mname"),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white
                ),
                child: Text("로그아웃"))
          ],
        ),
      ),
    );
  }
}