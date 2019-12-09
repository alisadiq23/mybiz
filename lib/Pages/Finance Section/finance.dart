import 'package:mybiz/Pages/Setup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:mybiz/Pages/home.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mybiz/Pages/operations.dart'as prefix2;
import 'package:mybiz/Pages/customers.dart'as prefix3;
import 'package:mybiz/Pages/executive.dart'as prefix4;
import 'package:mybiz/Pages/Setup/setting.dart'as prefix5;
import 'package:mybiz/Pages/tutorial.dart'as prefix6;
import 'package:mybiz/Pages/about.dart'as prefix7;
import 'package:mybiz/Pages/contacts.dart'as prefix8;

class FinancePage extends StatefulWidget {
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {

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

   Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: false,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Finance Section"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
          },
          tooltip: "Core Function of Finance Section",
        ),
        DataColumn(
          label: Text("Revenue"),
          numeric: true,
          onSort: (i, b) {
            print("$i $b");
          },
          tooltip: "All the total will be calculate.",
        ),
      ],
      rows: names
          .map(
            (name) => DataRow(
                  cells: [
                    DataCell(
                      Text(name.financecore),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name.revenuecore),
                      showEditIcon: true,
                      placeholder: false,
                    )
                  ],
                ),
          )
          .toList());

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finance", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
        ],
      ),
      body: Container(
        child: bodyData()),
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
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => prefix5.Settings(), fullscreenDialog: true));
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
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => prefix0.Home()), (Route<dynamic> route) => false);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => prefix0.Home(), fullscreenDialog: true));
              }
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('FINANCE'),
              trailing: Icon(Icons.monetization_on),
              onTap: () {
              Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => prefix1.Finance(), fullscreenDialog: true));
              }
            ),
              
            Divider(height: 2.0,),
            ListTile(
              title: Text('OPERATIONS'),
              trailing: Icon(Icons.work),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => prefix2.Operations(), fullscreenDialog: true));
              }
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('CUSTOMERS'),
              trailing: Icon(Icons.people),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => prefix3.Customers(), fullscreenDialog: true));
              }
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('EXECUTIVE'),
              trailing: Icon(Icons.people_outline),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => prefix4.Executive(), fullscreenDialog: true));
              }
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
              onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => prefix6.Tutorials(), fullscreenDialog: true));
              }
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('ABOUT'),
              trailing: Icon(Icons.info),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => prefix7.About(), fullscreenDialog: true));
              }
            ),
            Divider(height: 2.0,),
            ListTile(
              title: Text('CONTACT'),
              trailing: Icon(Icons.contacts),
              onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => prefix8.Contacts(), fullscreenDialog: true));
              }
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

  
class Name {
  String financecore;
  String revenuecore;

  Name({this.financecore, this.revenuecore});
}

var names = <Name>[
  Name(financecore: "Balance Sheet", revenuecore: "5810000"),
  Name(financecore: "Profit and Loss", revenuecore: "695506"),
  Name(financecore: "Trading", revenuecore: "665741"),
  Name(financecore: "Manufactaring", revenuecore: "210005"),
  Name(financecore: "Others", revenuecore: "352200"),
];
