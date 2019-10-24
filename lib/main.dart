import 'package:flutter/material.dart';
import 'package:manufacturer/Authencation.dart';
import 'package:manufacturer/RootPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manafacturer',
      theme: ThemeData(
      ),
      home: RootPage(auth:new Auth()),
    );
  }
}

