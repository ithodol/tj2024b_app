

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Write extends StatefulWidget{
  @override
  _WriteState createState(){
    return _WriteState();
  }
} // Write class end

class _WriteState extends State<Write>{
  // 2. 텍스트 입력창에 사용되는 컨트롤러 객체 선언
    // 입력받은 값을 가져오기 위함
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // 2. 자바에게 통신하여 할 일 등록 처리하는 함수
  Dio dio = Dio();
  void todoSave() async{
    try{
      final sendData = {
        "title" : titleController.text,
        "content" : contentController.text,
        "done" : "false"
      };
      final response = await dio.post("http://192.168.40.45:8080/day04/todos", data: sendData);
      final data = response.data;
      if(data != null){ // 만약 등록에 성공하면
        Navigator.pushNamed(context, "/"); // 라우터를 이용해 "/" 메인페이지로 이동
      }
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("할 일 등록 화면"),),
      body: Center(
        child: Column(
          children: [
            Text("할 일을 등록하세요"),
            SizedBox(height: 30),
            TextField(
              controller: titleController, // title 입력받는 텍스트 입력 위젯
              decoration: InputDecoration(labelText: "제목"),
              maxLength: 30
            ),

            SizedBox(height: 30),
            TextField( // content 입력받는 텍스트 입력 위젯
              controller: contentController,
              decoration: InputDecoration(labelText: "내용"),
              maxLines: 5,
            ),

            SizedBox(height: 30),
            OutlinedButton(
                onPressed: todoSave,
                child: Text("등록하기")
            )

          ],
        ),
      ),
    );
  } // build end
} // _WriteState class end