import 'package:flutter/material.dart';
import 'package:zenfit/homepage.dart';
import 'package:zenfit/account.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   @override
  Widget build (BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Home(),
     );
   }
}