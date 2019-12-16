import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mybiz/Pages/Finance Section/Trading/Sales/sales.dart' as prefix1;
import 'package:mybiz/Pages/Finance Section/Trading/Sadjus/sadjus.dart' as prefix2;

class Trading extends StatefulWidget {
  @override
  _TradingPageState createState() => _TradingPageState();
}

class _TradingPageState extends State<Trading> {

  bool _isLoading = false;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(title: Text('Finance'),),
      body: Container(
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            bodyData(),
            textSection(),
            
          ],
        ),
      ),
    );
  }
  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Trading",
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold)),
    );
  }

    Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
        ],
      ),
    );

  }
     Widget bodyData() => DataTable(
     columns: [
       DataColumn(label: Text('Section', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)), numeric: false),
       DataColumn(label: Text('Total', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)), numeric: true),
     ],
     rows: [
      DataRow(cells: [
        DataCell(Text('SALES', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix1.Sales()),);}),
        DataCell(Text('5984210.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('SADJUS (SALES ADJUSTMENT)', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix2.Sadjus()),);}),
        DataCell(Text('7777777.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
     ],
   );
}