import 'package:flutter/material.dart';
import 'package:sqflite_flutter_app/pages/login/home_page.dart';
import 'package:sqflite_flutter_app/pages/login/login_page.dart';

void main() => runApp(new MyApp());

final routes={
  '/login':(BuildContext context)=>new LoginPage(),
  '/home':(BuildContext context)=>new HomePage(),
  '/':(BuildContext context)=>new LoginPage(),
};
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sqflite App',
      theme: new ThemeData(
        primarySwatch: Colors.teal,


      ),
      routes: routes,

    );
  }
}
