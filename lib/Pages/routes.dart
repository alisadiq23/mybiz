import 'package:flutter/material.dart';
import 'package:mybiz/main.dart';
import 'package:mybiz/Pages/home.dart';
import 'package:mybiz/Pages/Setup/sign_in.dart';
import 'package:mybiz/Pages/Setup/sign_up.dart';
import 'package:mybiz/Pages/Setup/welcome.dart';

final routes = {
  '/signin':         (BuildContext context) => new LoginPage(),
  '/signup':        (BuildContext context) => new SignUpPage(),
  '/home':         (BuildContext context) => new Home(),
  '/' :          (BuildContext context) => new LoginPage(),
  '/main' :          (BuildContext context) => new MyApp(),
  '/welcome' :          (BuildContext context) => new WelcomePage(),
};