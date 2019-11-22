import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';

class DailyBakery extends StatefulWidget {
  @override
  _DailyBakeryState createState() => _DailyBakeryState();
}

class _DailyBakeryState extends State<DailyBakery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Daily Bakery'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: DBA(collection: 'Daily Bakery')),
      ),
    );
  }
}
