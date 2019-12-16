import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Expenses extends StatefulWidget {
  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<Expenses> {

  bool _isLoading = false;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(title: Text('Profit and Loss'),),
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
      child: Text("EXPENSES",
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
        DataCell(Text('Salaries', style: TextStyle(fontSize: 14))),
        DataCell(Text('5984210.00', style: TextStyle(fontSize: 14)), showEditIcon: true), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('EPF', style: TextStyle(fontSize: 14))),
        DataCell(Text('5984210.00', style: TextStyle(fontSize: 14)), showEditIcon: true), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('SOCSO', style: TextStyle(fontSize: 14))),
        DataCell(Text('5984210.00', style: TextStyle(fontSize: 14)), showEditIcon: true), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('Rental - Office', style: TextStyle(fontSize: 14))),
        DataCell(Text('5984210.00', style: TextStyle(fontSize: 14)), showEditIcon: true), //later to be implement with the database. making it numerical also perhaps
      ]),
     ],
   );
}