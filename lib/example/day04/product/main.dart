import 'package:flutter/material.dart';
import 'package:tj2024b_app/example/day04/product/detail.dart';
import 'package:tj2024b_app/example/day04/product/home.dart';
import 'package:tj2024b_app/example/day04/product/update.dart';
import 'package:tj2024b_app/example/day04/product/write.dart';

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
        "/update" : (context) => Update(),
      },
    );
  }
}