import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login>{
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();


  void onLogin() async{
    final sendData = {
      'memail' : emailController.text,
      'mpwd' : pwdController.text
    };

    try{
      Dio dio = Dio();
      final response = await dio.post("http://localhost:8080/member/login", data: sendData);
      final data = response.data;
      if(data != ''){
        print("로그인 성공");
      }else{
        print("로그인 실패");
      }
    }catch(e){
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold( // 레이아웃 위젯
      body: Container( // 여백 제공 박스 위젯
        padding: EdgeInsets.all(30), // 안쪽 여백
        margin: EdgeInsets.all(30), // 바깥 여백
        child: Column( // 하위 요소 세로 배치
          mainAxisAlignment: MainAxisAlignment.center, // 현재 축(Column) 기준으로 정렬 (flex와 같음)
          children: [ // 하위 요소들
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "이메일", border: OutlineInputBorder()),
            ),

            SizedBox(height: 20),
            TextField(
              controller: pwdController, obscureText: true, // 입력값 감추기
              decoration: InputDecoration(labelText: "비밀번호", border: OutlineInputBorder()),
            ),

            SizedBox(height: 20),
            ElevatedButton(
                onPressed: onLogin,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white
                ),
                child: Text("로그인")
            ),

            SizedBox(height: 20),
            TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    foregroundColor: Colors.orange
                ),
                child: Text("회원가입"))
          ],
        ),
      ),
    );
  }
}