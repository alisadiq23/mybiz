import 'package:mybiz/Pages/Finance%20Section/finance.dart';
import 'package:mybiz/Pages/Setup/welcome.dart';
import 'package:flutter/material.dart';

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
      home: FinancePage(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        minimum: const EdgeInsets.all(16.0), child: null,
      ),
    );
  }
}