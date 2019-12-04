import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeDBA.dart';

class EmployeeGrabAndGo extends StatefulWidget {
  @override
  _EmployeeGrabAndGoState createState() => _EmployeeGrabAndGoState();
}

class _EmployeeGrabAndGoState extends State<EmployeeGrabAndGo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Grab & Go'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: EmployeeDBA(collection: 'Grab & Go')),
      ),
    );
  }
}
