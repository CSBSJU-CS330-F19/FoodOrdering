import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';

class Beverages extends StatefulWidget {
  @override
  _BeveragesState createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
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
          child: DBA(collection: 'Beverages'),
        ),
      ),
    );
  }
}
