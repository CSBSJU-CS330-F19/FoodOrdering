import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';

class GrabAndGo extends StatefulWidget {
  @override
  _GrabAndGoState createState() => _GrabAndGoState();
}

class _GrabAndGoState extends State<GrabAndGo> {
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
            child: DBA(collection: 'Grab & Go')),
      ),
    );
  }
}
