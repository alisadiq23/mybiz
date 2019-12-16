import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mybiz/Pages/Finance Section/Profitnloss/Closingstock/closingStock.dart' as prefix1;
import 'package:mybiz/Pages/Finance Section/Profitnloss/Purchases/purchases.dart' as prefix2;
import 'package:mybiz/Pages/Finance Section/Profitnloss/Cogs/cogs.dart' as prefix3;
import 'package:mybiz/Pages/Finance Section/Profitnloss/OStock/openingStock.dart' as prefix4;
import 'package:mybiz/Pages/Finance Section/Profitnloss/Expenses/expenses.dart' as prefix5;
import 'package:mybiz/Pages/Finance Section/Profitnloss/OI/otherIncome.dart' as prefix6;

class ProfitNLoss extends StatefulWidget {
  @override
  _ProfitNLossPageState createState() => _ProfitNLossPageState();
}

class _ProfitNLossPageState extends State<ProfitNLoss> {

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
      child: Text("Profit And loss",
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
        DataCell(Text('CS (CLOSING STOCK)', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix1.ClosingStock()),);}),
        DataCell(Text('5984210.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('PURCHASES', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix2.Purchases()),);}),
        DataCell(Text('7777777.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('COGS (COST OF GOODS SOLD)', style: TextStyle(fontSize: 14)),  showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix3.Cogs()),);}),
        DataCell(Text('5555++++.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('OS (OPENING STOCK)', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix4.OpeningStock()),);}),
        DataCell(Text('1234567.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('EXP (EXPENSES)', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix5.Expenses()),);}),
        DataCell(Text('200001.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
      DataRow(cells: [
        DataCell(Text('OI (OTHER INCOME)', style: TextStyle(fontSize: 14)), showEditIcon: true, onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => prefix6.OI()),);}),
        DataCell(Text('200001.00', style: TextStyle(fontSize: 14))), //later to be implement with the database. making it numerical also perhaps
      ]),
     ],
   );
}