import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tj2024b_app/app/member/login.dart';

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
      'memail' : emailController.text,
      'mpwd' : pwdController.text,
      'mname' : nameController.text
    };
    print(sendData);

    // * Rest API 통신 간의 로딩 화면 표시 , showDialog() : 팝업 창 띄우기 위한 위젯
    showDialog(
      context: context,
      builder: (context) => Center( child: CircularProgressIndicator() ,),
      barrierDismissible: false, // 팝업창(로딩화면) 외 바깥 클릭 차단
    );

    try {
      Dio dio = Dio();
      final response = await dio.post("http://localhost:8080/member/signup", data: sendData);
      final data = response.data;

      Navigator.pop(context); // 가장 앞(가장 최근에 열린)에 있는 위젯 닫기 ( showDialog() : 팝업 창 )

      if (data) {
        print("회원가입 성공");

        Fluttertoast.showToast(
          msg: "회원가입 성공 했습니다", // 출력할내용
          toastLength : Toast.LENGTH_LONG , // 메시지 유지시간
          gravity : ToastGravity.BOTTOM, // 메시지 위치 : 앱 적용
          timeInSecForIosWeb: 3 , // 자세한 유지시간 (sec)
          backgroundColor: Colors.black, // 배경색
          textColor: Colors.white, // 글자색상
          fontSize : 16, // 글자크기
        );

        // * 페이지 전환
        Navigator.pushReplacement(context,  MaterialPageRoute(builder:  (context)=>Login() ) );
      }else {
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
              TextButton( onPressed: ()=>{
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context)=> Login() )
                  )
                }, child: Text("이미 가입된 사용자 이면 _로그인")
              )
            ],
          ),
      )

    );
  }
}