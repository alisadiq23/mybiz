import 'package:mybiz/pages/setup/sign_in.dart';
import 'package:mybiz/pages/setup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        title: Text('MyBiz'),
      ),
      body: Container(
                padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey[900], Colors.lightBlue[100]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignIn,
            elevation: 0.0,
        color: Colors.white,
        child: Text("Sign In", style: TextStyle(color: Colors.black)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          RaisedButton(
            onPressed: navigateToSignUp,
             elevation: 0.0,
        color: Colors.white,
        child: Text("Sign Up", style: TextStyle(color: Colors.black)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ],
      ),
      ),
    );
  }



  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
