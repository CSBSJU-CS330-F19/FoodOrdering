import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeeAccount extends StatefulWidget {
  @override
  _EmployeeAccountState createState() => _EmployeeAccountState();
}

final databaseReference = Firestore.instance;

class _EmployeeAccountState extends State<EmployeeAccount> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Employee Account'),
        backgroundColor: Colors.red,
      ),
      body: Center(child: new Text('I am the employee account page')),
    );
  }
}
