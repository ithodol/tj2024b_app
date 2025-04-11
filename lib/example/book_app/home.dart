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


  void delete(int id) async{
    try{
      final response = await dio.delete("http://192.168.40.45:8080/book?id=$id");
      final data = response.data;
      if(data == true){
        findAll();
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
                            IconButton(onPressed: () => {delete(book['id']) } , icon: Icon( Icons.delete ) ),
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









