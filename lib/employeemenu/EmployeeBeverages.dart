import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeDBA.dart';

class EmployeeBeverages extends StatefulWidget {
  @override
  _EmployeeBeveragesState createState() => _EmployeeBeveragesState();
}

class _EmployeeBeveragesState extends State<EmployeeBeverages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Beverages'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: EmployeeDBA(collection: 'Beverages'),
        ),
      ),
    );
  }
}
