import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';

class DeliDaily extends StatefulWidget {
  @override
  _DeliDailyState createState() => _DeliDailyState();
}

class _DeliDailyState extends State<DeliDaily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Deli Daily'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: DBA(collection: 'Deli Daily')),
      ),
    );
  }
}
