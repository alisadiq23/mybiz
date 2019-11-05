import 'package:mybiz/Pages/Setup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:mybiz/Services/api_service.dart';

void main() => runApp(MyApp());

class Urls {
  static const BASE_API_URL = "https://mybiz-staging.herokuapp.com/login/";
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mybiz Test',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: WelcomePage(),
    );
  }
}