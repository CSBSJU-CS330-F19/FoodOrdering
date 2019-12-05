import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeDBA.dart';

class EmployeeGrillDaily extends StatefulWidget {
  @override
  _EmployeeGrillDailyState createState() => _EmployeeGrillDailyState();
}

class _EmployeeGrillDailyState extends State<EmployeeGrillDaily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Grill Daily'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: EmpDBAState(collection: 'Grill Daily')),
      ),
    );
  }
}
