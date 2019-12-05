import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeDBA.dart';

class EmployeeDailyBakery extends StatefulWidget {
  @override
  _EmployeeDailyBakeryState createState() => _EmployeeDailyBakeryState();
}

class _EmployeeDailyBakeryState extends State<EmployeeDailyBakery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Daily Bakery'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: EmpDBAState(collection: 'Daily Bakery')),
      ),
    );
  }
}
