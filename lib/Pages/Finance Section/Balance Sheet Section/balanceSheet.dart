import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mybiz/Pages/Finance Section/Balance Sheet Section/Capital/SCcapital.dart' as prefix1;
import 'package:mybiz/Pages/Finance Section/Balance Sheet Section/Fixedassets/fixedAsset.dart' as prefix2;
import 'package:mybiz/Pages/Finance Section/Balance Sheet Section/Accumulateddep/accumulatedDepreciation.dart' as prefix3;
import 'package:mybiz/Pages/Finance Section/Balance Sheet Section/Banks/bank.dart' as prefix4;
import 'package:mybiz/Pages/Finance Section/Balance Sheet Section/Accruals/accruals.dart' as prefix5;
import 'package:mybiz/Pages/Finance Section/Balance Sheet Section/Currentliabilities/currentLiabilities.dart' as prefix6;

class BalanceSheet extends StatefulWidget {
  @override
  _BalanceSheetPageState createState() => _BalanceSheetPageState();
}

class _BalanceSheetPageState extends State<BalanceSheet> {

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
      child: Text("Balance Sheet",
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
        DataCell(Text('SC (CAPITAL)', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix1.SCcapital()),);}),
        DataCell(Text('5984210.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('FA (FIXED ASSETS)', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix2.FixedAssets()),);}),
        DataCell(Text('7777777.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('AD (ACCUMULATED DEPRECIATION)', style: TextStyle(fontSize: 14)),  showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix3.AccumulatedDepreciation()),);}),
        DataCell(Text('5555++++.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('BANK', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix4.Bank()),);}),
        DataCell(Text('1234567.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('ACCRUALS', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix5.Accruals()),);}),
        DataCell(Text('200001.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('CL (CURRENT LIABILITIES)', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix6.CurrentLiabilities()),);}),
        DataCell(Text('200001.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
     ],
   );
}