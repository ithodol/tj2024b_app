import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget{
  @override
  _UpdateSate createState() {
    return _UpdateSate();
  }
}

class _UpdateSate extends State<Update> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int id = ModalRoute.of(context)!.settings.arguments as int;
    print("아이디 : ${id}");
    findById(id);
  }
  
  Dio dio = Dio();
  Map<String, dynamic> product = {};



  void findById(int id) async{
    try{
      final response = await dio.get("http://192.168.40.45:8080/day04/products/view?id=$id");
      final data = response.data;

      setState(() {
        product = data;
        nameController.text = data['name'];
        descriptionController.text = data['description'];

      });
    }catch(e){print(e);}
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  void update() async{
    try{
      final sendData = {
        "id" : product['id'],
        "name" : nameController.text,
        "description" : descriptionController.text,
        "quantity" : quantityController.text
      };
      final response = await dio.put("http://192.168.40.45:8080/day04/products" , data : sendData);
      final data = response.data;
      if(data != null){
        Navigator.pushNamed(context, "/");
      }
    }catch(e){print(e);}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("비품 수정"),),
      body: Center(
        child: Column(
          children: [
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
                maxLines: 3
            ),

            SizedBox(height: 30),
            TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: "수량"),
                maxLength: 3
            ),
            SizedBox( height: 30,) ,
            OutlinedButton( onPressed: update, child: Text("수정하기") )
          ],
        ),
      ),
    );
  }


}