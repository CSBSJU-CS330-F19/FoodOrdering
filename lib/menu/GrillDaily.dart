import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';

class GrillDaily extends StatefulWidget {
  @override
  _GrillDailyState createState() => _GrillDailyState();
}

class _GrillDailyState extends State<GrillDaily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Grill Daily'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: DBA(collection: 'Grill Daily')),
      ),
    );
  }
}
