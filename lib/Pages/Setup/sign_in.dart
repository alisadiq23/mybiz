import 'dart:convert';
import 'package:mybiz/Pages/home.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(title: Text('Sign In'),),
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

   TextEditingController userController = new TextEditingController();
   TextEditingController passwordController = new TextEditingController();

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
        _showDialog();
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
            userController.text.isEmpty ? _validate = true : _validate = false;
            passwordController.text.isEmpty ? _validate = true : _validate = false;
          });
          setState(() {
            _isLoading = true;
          });
          signIn(userController.text, passwordController.text);
         
        },
        elevation: 0.0,
        color: Colors.blue,
        child: Text("Sign In", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      );
  }



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
              errorText: _validate ? 'Value Can\'t be Empty' :null,
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

  void _showDialog(){
    showDialog(
      context:context ,
      builder:(BuildContext context){
        return AlertDialog(
          title: new Text('Failed'),
          content:  new Text('Check your email or password'),
          actions: <Widget>[
            new RaisedButton(

              child: new Text("Close", style: TextStyle(color: Colors.white70)),

              onPressed: (){
                Navigator.of(context).pop();
              },

            ),
          ],
        );
      }
    );
  }


}
