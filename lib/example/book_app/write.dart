import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Write extends StatefulWidget{
  _WriteState createState(){
    return _WriteState();
  }
}

class _WriteState extends State<Write>{

  final TextEditingController titleController = TextEditingController();
  final TextEditingController writerController = TextEditingController();
  final TextEditingController memoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Dio dio = Dio();

  void create() async{
    try{
      final sendData = {
        "title" : titleController.text,
        "writer" : writerController.text,
        "memo" : memoController.text,
        "password": passwordController.text
      };
      final response = await dio.post("http://192.168.40.45:8080/book", data: sendData);
      final data = response.data;
      if(data != null){
        Navigator.pushNamed(context, "/");
      }
    }catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("추천 도서 등록")),
      body: Center(
        child: Column(
          children: [
            Text("내용을 입력하세요"),

            SizedBox(height: 30),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "제목"),
              maxLength: 30
            ),

            SizedBox(height: 30),
            TextField(
                controller: writerController,
                decoration: InputDecoration(labelText: "저자"),
                maxLength: 30
            ),

            SizedBox(height: 30),
            TextField(
                controller: memoController,
                decoration: InputDecoration(labelText: "소개"),
                maxLines: 3
            ),

            SizedBox(height: 30),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "비밀번호"),
              obscureText: true,
              maxLength: 30,
            ),

            SizedBox(height: 30),
            OutlinedButton(
                onPressed: create,
                child: Text("등록하기")
            )
          ],
        ),
      ),
    );
  }
}