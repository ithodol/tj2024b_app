import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // 2. 해당 위젯(페이지) 열렸을 때 실행되는 함수
  @override
  void initState() { // 리액트 훅 :  useEffect(, []) 와 같음
    loginCheck();
  }

  // 3. 로그인 상태를 확인하는 함수
  bool? isLogin; // Dart문법 : 타입?은 null을 포함할 수 있다
  void loginCheck() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if(token != null && token.isNotEmpty){ // 전역변수에 (로그인) 토큰이 존재하면
      setState(() {
        isLogin = true;
        print(">> 로그인 중");
        onInfo(token); // 로그인 중일 때 로그인 정보 요청 함수 실행
      });      
    }else{
      setState(() {
        isLogin = false;
        print("비로그인 중");
      });
    }
  }

  // 4. 로그인된 (회원) 정보 요청, 로그인 중일 때 실행
  void onInfo(token) async{
    try{
      Dio dio = Dio();
      // ** Dio에서 headers 정보를 보내는 방법 , Options
        // [방법1] dio.options.headers['속성명'] = 값;
        // [방법2] dio.get(options : {headers : {'속성명' : 값}}
      dio.options.headers['Authorization'] = token;
      final response = await dio.get("http://localhost:8080/member/info");
      final data = response.data;
      if(data != ''){ // 만약 비어있지 않으면(로그인 됐다면)
        setState(() {
          mno = data['mno'];
          memail = data['memail'];
          mname = data['mname'];
        });
      }
    }catch(e){
      print(e);
    }
  }

  // 5. 로그아웃 요청


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