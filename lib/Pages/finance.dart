import 'package:mybiz/Pages/Setup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:mybiz/Pages/home.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';

class Finance extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: "Finance Page",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

   SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => WelcomePage()), (Route<dynamic> route) => false);
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyBiz", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
        ],
      ),
      body: Center(child: Text("Finance page test/this is a test for the drawer")),
      drawer: Drawer(
        child:SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        minimum: const EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: Text('Christopher Nolan'),//tbd, name link with database user who logged in
              accountEmail: Text('airaztechologies@icloud.com'),//tbd, email link with database user who logged in / or can change to user privileged.
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.fill, 
                    image: ExactAssetImage('assets/images/nolan.jpg') ), //tbd, image link with database user who logged in
                ),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundImage: ExactAssetImage ('assets/images/setting.png'),
                  child: GestureDetector(
                  onTap: (){
                    print('g setting'); //tbd, link to setting, perhaps
                  },
                ),
                )
              ],
            ),
            

            Divider(height: 2.0,),
            ListTile(
              title: Text('DASHBOARD'),
              trailing: Icon(Icons.dashboard),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => prefix0.Home(), fullscreenDialog: true));
              }
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('FINANCE'),
              trailing: Icon(Icons.monetization_on),
              onTap: () {
              Navigator.pop(context);
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => null, fullscreenDialog: true));
              }
            ),
              
            Divider(height: 2.0,),
            ListTile(
              title: Text('OPERATIONS'),
              trailing: Icon(Icons.work),
              //onTap: (),
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('CUSTOMERS'),
              trailing: Icon(Icons.people),
              //onTap: (),
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('EXECUTIVE'),
              trailing: Icon(Icons.people_outline),
              //onTap: (),
            ),


                Divider(
                  thickness: 6.0,
                  height: 10.0,
                  endIndent: 0.0,
                  indent: 0.0,                  
                  ),

            ListTile(
              title: Text('TUTORIAL'),
              trailing: Icon(Icons.ondemand_video),
              //onTap: (),
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('ABOUT'),
              trailing: Icon(Icons.info),
              //onTap: (),
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('CONTACT'),
              trailing: Icon(Icons.contacts),
              //onTap: (),
            ),
            Divider(height: 2.0,),
              new RaisedButton(
              onPressed: () {
              sharedPreferences.clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => WelcomePage()), (Route<dynamic> route) => false);
              },
              textColor: Colors.white,
              color: Colors.red,
              child: new Text(
                'LOGOUT',
              ),
            ),
              ],
        ),
      ),
      ),
    );
  }
}