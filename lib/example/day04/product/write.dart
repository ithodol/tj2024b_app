import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Write extends StatefulWidget{
  @override
  _WriteState createState(){
    return _WriteState();
  }
}

class _WriteState extends State<Write>{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  Dio dio = Dio();

  void create() async{
    try{
      final sendData = {
        "name" : nameController.text,
        "description" : descriptionController.text,
        "quantity" : quantityController.text
      };

      final response = await dio.post("http://192.168.40.45:8080/day04/products", data : sendData);
      final data = response.data;
      if(data != null){
        Navigator.pushNamed(context, "/");
      }

    }catch(e){print(e);}
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("비품 등록"),),
      body: Center(
        child: Column(
          children: [
            Text("내용을 입력하세요"),
            SizedBox(height: 30),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "비품명"),
              maxLength: 30
            ),

            SizedBox(height: 30),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "내용"),
                maxLines: 2
            ),

            SizedBox(height: 30),
            TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: "수량"),
                maxLength: 3
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