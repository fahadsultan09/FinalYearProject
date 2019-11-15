


import 'package:shared_preferences/shared_preferences.dart';

Future<void> setName(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Name', name);
}

Future<String> getName()async{
 SharedPreferences prefs = await SharedPreferences.getInstance();

 return prefs.getString('Name');
}
Future<void> setEmail(String Email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Email', Email);
}

Future<String> getEmail()async{
 SharedPreferences prefs = await SharedPreferences.getInstance();

 return prefs.getString('Email');
}