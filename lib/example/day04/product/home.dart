import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState(){
    return _HomeState();
  }
}



class _HomeState extends State<Home>{
  Dio dio = Dio();
  
  List<dynamic> productList = [];
  
  

  void findAll() async{
    try{
      final response = await dio.get("http://192.168.40.45:8080/day04/products");
      final data = response.data;
      
      setState(() {
        productList = data;
      });
    }catch(e){print(e);}
  }

  @override
  void initState() {
    super.initState();
    findAll();
  }
  
  void delete(int id) async{
    try{
      final response = await dio.delete("http://192.168.40.45:8080/day04/products?id=$id");
      final data = response.data;
      if(data == true){
        findAll();
      }

    }catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("이토돌컴퍼니 비품 관리"),),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () =>{Navigator.pushNamed(context, "/write")},
                child: Text("비품 추가")
            ),

            SizedBox(height: 30,),
            
            Expanded(
                child: ListView(
                 children: productList.map( (product) {
                     return Card(
                        child: ListTile(
                        title: Text(product['name']),
                        subtitle: Column(
                          children: [
                            Text("내용 : ${product['description']}"),
                            Text("수량 : ${product['quantity']}"),
                            Text("등록일자 : ${product['createDateTime'].split('T')[0]}")
                          ],
                        ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(onPressed: () => {Navigator.pushNamed(context, "/update", arguments : product['id'] )}, icon: Icon(Icons.edit)),
                              IconButton(onPressed: () => {Navigator.pushNamed(context, "/detail", arguments : product['id'] )}, icon: Icon(Icons.info)),
                              IconButton(onPressed: () => {delete(product['id'])}, icon: Icon(Icons.delete)),
                            ],
                          )
                     )
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