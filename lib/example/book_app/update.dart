import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget{
  @override
  _UpdateSate createState() {
    return _UpdateSate();
  }
}

class _UpdateSate extends State<Update> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController writerController = TextEditingController();
  final TextEditingController memoController = TextEditingController();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();


    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! int) {
      print('잘못된 arguments입니다. $args'); // 오류 메시지 출력
      return; // arguments가 없거나 int가 아닐 경우 아무 것도 하지 않음
    }

    int id = args;  // arguments가 int일 때만 처리
    if (titleController.text == '') {
      findById(id); // id로 책 정보를 불러오기
    }
  }

  Dio dio = Dio();

  Map<String, dynamic> book = {};

  void findById(int id) async{
    try {
      final response = await dio.get("http://192.168.40.45:8080/book/view?id=$id");
      final data = response.data;

      if (data != null) {
        setState(() {
          book = data;
          titleController.text = data['title'];
          writerController.text = data['writer'];
          memoController.text = data['memo'];
        });
      } else {
        print('데이터를 찾을 수 없습니다.');
      }
    } catch (e) {
      print(e);
    }
  }


  void update() async{
    try{
      final password = await showPasswordDialog(context);
      if (password == null || password.isEmpty) return;

      final sendData = {
        "id" : book['id'],
        "title" : titleController.text,
        "writer" : writerController.text,
        "memo" : memoController.text,
        "password": password
      };
      final response = await dio.put("http://192.168.40.45:8080/book", data: sendData);
      final data = response.data;
      print("데이터는 $data");
      if(data == ''){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content:Text("비밀번호를 확인하세요")));
      }else{
        Navigator.pushNamed(context, "/");
      }
    }catch(e){print(e);}
  }

  Future<String?> showPasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("비밀번호 확인"),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: "비밀번호"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 취소
              },
              child: Text("취소"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(passwordController.text); // 입력값 반환
              },
              child: Text("확인"),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("도서 수정")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: InputDecoration( labelText: "제목"),
              maxLength: 30,
            ),

            SizedBox(height: 20),
            TextField(
              controller: writerController,
              decoration: InputDecoration( labelText: "저자"),
              maxLength: 30,
            ),

            SizedBox(height: 20),
            TextField(
              controller: memoController,
              decoration: InputDecoration( labelText: "소개"),
              maxLines: 3,
            ),
            
            SizedBox(height: 20),
            OutlinedButton(onPressed: update, child: Text("수정하기"))
          ],
        ),
      ),
    );
  }
}