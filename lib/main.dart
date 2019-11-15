import 'package:flutter/material.dart';


import 'Login/Authencation.dart';
import 'Login/RootPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manafacturer',
      theme: ThemeData(
        // primaryColor: Colors.black,
      ),
      home: RootPage(auth:new Auth()),
    );
  }
}

