import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeDBA.dart';

class EmployeeDeliDaily extends StatefulWidget {
  @override
  _EmployeeDeliDailyState createState() => _EmployeeDeliDailyState();
}

class _EmployeeDeliDailyState extends State<EmployeeDeliDaily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Deli Daily'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: EmpDBAState(collection: 'Deli Daily')),
      ),
    );
  }
}
