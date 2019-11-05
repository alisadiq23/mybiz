import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybiz/pages/setup/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:mybiz/Services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:mybiz/Pages/home.dart' as prefix0;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  
    bool _isLoading = false;

    @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'),),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey[900], Colors.lightBlue[100]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }

  signIn(String username, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'username': username,
      'password': pass,
    };
    var jsonResponse;
    var response = await http.post('https://mybiz-staging.herokuapp.com/login/', body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => prefix0.Home()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: userController.text == "" || passwordController.text == "" ? null : () {
          setState(() {
            _isLoading = true;
          });
          signIn(userController.text, passwordController.text);
        },
        elevation: 0.0,
        color: Colors.purple,
        child: Text("Sign Up", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      );
  }

  final TextEditingController userController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: userController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.verified_user, color: Colors.white70),
              hintText: "Username",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
      SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Re-Type Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("MyBiz",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
}