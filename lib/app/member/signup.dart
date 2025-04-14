import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignupState(); 
  }
}

class _SignupState extends State<Signup>{
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // 등록 버튼 클릭시
  void onSignup() async{
    final sendData = {
      'email' : emailController.text,
      'mpwd' : pwdController.text,
      'mname' : nameController.text
    };
    print(sendData);

    try {
      Dio dio = Dio();
      final response = await dio.post("http://localhost:8080/member/signup", data: sendData);
      final data = response.data;
      if (data == true) {
        print("회원가입 성공");
      } else {
        print("회원가입 실패");
      }
    }catch(e){print(e);}
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( // 안쪽 여백
        padding: EdgeInsets.all(50), // EdgeInsets.all : 상하좌우 모두 적영되는 안쪽 여백
        margin : EdgeInsets.all(50),
        child:
          Column( // 세로배치
            children: [ // 하위 위젯
              SizedBox(height: 30),
              TextField( // 이메일(id)
                controller: emailController,
                decoration: InputDecoration(label: Text("이메일"), border: OutlineInputBorder()),
              ),

              SizedBox(height: 30),
              TextField( // 비밀번호
                controller: pwdController,
                obscureText: true, // 입력한 텍스트 가리기
                decoration: InputDecoration(label: Text("비밀번호"), border: OutlineInputBorder()),
              ),

              SizedBox(height: 30),
              TextField( // 닉네임
                controller: nameController,
                decoration: InputDecoration(label: Text("닉네임"), border: OutlineInputBorder()),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: onSignup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white
                ),
                child: Text('회원가입')
              ),
              SizedBox(height: 10),
              TextButton(
                  onPressed: () => {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.orange
                  ),
                  child: Text("로그인")
              )
            ],
          ),
      )

    );
  }
}