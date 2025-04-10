import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget{
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
  Map<String,dynamic> product = { }; // 응답 결과를 저장하는 하나의 '일정' 객체 선언
  void findById( id ) async{
    try{
      final response = await dio.get( "http://192.168.40.45:8080/day04/products/view?id=$id");
      final data = response.data;
      setState(() {
        product = data; // 응답받은 결과를 상태변수에 대입
      });
      print( product );
    }catch(e){ print( e ); }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("비품 상세 조회"),),
      body: Center(
        child: Column(
          children: [
            Text("비품명 : ${product['name']}", style: TextStyle( fontSize: 25 )),
            SizedBox(height: 8),

            Text("내용 : ${product['description']}", style: TextStyle( fontSize: 20 )),
            SizedBox(height: 8),

            Text("수량 : ${product['quantity']}", style: TextStyle( fontSize: 15 )),
            SizedBox(height: 8),

            Text("등록일자 : ${product['createDateTime'].split('T')[0]}", style: TextStyle( fontSize: 15 )),
            SizedBox(height: 8),

          ],
        ),
      ),
    );
  }
}