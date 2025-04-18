import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() {
    return _HomeState();
  }
}


class _HomeState extends State<Home>{
  Dio dio = Dio();

  List<dynamic> bookList = [];

  void findAll() async{
    try{
      final response = await dio.get("http://192.168.40.45:8080/book");
      final data = response.data;

      setState(() {
        bookList = data;
      });
    }catch(e){print(e);}
  }

  @override
  void initState() {
    super.initState();
    findAll();
  }



  void showDeleteDialog(int id) {
    TextEditingController pwdController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('비밀번호 확인'),
          content: TextField(
            controller: pwdController,
            obscureText: true,
            decoration: InputDecoration(hintText: "비밀번호 입력"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                delete(id, pwdController.text);
              },
              child: Text("삭제"),
            ),
          ],
        );
      },
    );
  }

  void delete(int id, String password) async{
    try{
      final response = await dio.delete("http://192.168.40.45:8080/book",
        queryParameters: {
          "id": id,
          "password": password
        }
      );
      final data = response.data;
      if(data == true){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("삭제 완료")));
        findAll();
      }else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("비밀번호가 일치하지 않습니다")));
      }
    }catch(e){print(e);}
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("도서 추천 앱 플랫폼")),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () => {Navigator.pushNamed(context, "/write")},
                child: Text("추천 도서 등록")
            ),

            SizedBox(height: 30),
            
            Expanded(
                child: ListView(
                  children: bookList.map( (book) {
                    return Card(
                      child: ListTile(
                        title: Text(book['title']),
                        subtitle: Column(
                          children: [
                            Text("저자 : ${book['writer']}"),
                            Text("소개 : ${book['memo']}"),
                            Text("등록일자 : ${book['createDateTime'].split('T')[0]}")
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () => {Navigator.pushNamed(context, "/update", arguments : book['id'])}, icon: Icon(Icons.edit)),
                            IconButton(onPressed: () => {Navigator.pushNamed(context, "/detail", arguments : book['id'])}, icon: Icon(Icons.info)),
                            IconButton(onPressed: () => showDeleteDialog(book['id']) , icon: Icon( Icons.delete ) ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )
            )


          ],
        ),
      ),
    );
  }
}









