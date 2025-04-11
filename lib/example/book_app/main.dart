import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tj2024b_app/example/book_app/detail.dart';
import 'package:tj2024b_app/example/book_app/home.dart';
import 'package:tj2024b_app/example/book_app/update.dart';
import 'package:tj2024b_app/example/book_app/write.dart';
import 'package:tj2024b_app/example/day03/example3.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => Home(),
        "/write" : (context) => Write(),
        "/detail" : (context) => Detail(),
        "/update" : (context) => Update()
      },
    );
  }
}