import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() {
    return _DetailState();
  }
}


class _DetailState extends State<Detail>{
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int id = ModalRoute.of(context)!.settings.arguments as int;
    findById(id);
  }

  Dio dio = Dio();
  Map<String, dynamic> book = {};
  void findById(id) async {
    try{
      final response = await dio.get("http://192.168.40.45:8080/book/view?id=$id");
      final data = response.data;
      setState(() {
        book = data;
      });
    }catch(e){print(e);}
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상세 조회")),
      body: Center(
        child: Column(
          children: [
            Text("제목 : ${book['title']}", style: TextStyle(fontSize: 25)),
            SizedBox(height: 10),

            Text("저자 : ${book['writer']}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),

            Text("소개 : ${book['memo']}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),

            Text("등록일자 : ${book['createDateTime'].split('T')[0]}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
















