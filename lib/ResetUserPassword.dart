import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';
import 'package:mcglynns_food2go/DBACart.dart';

class ResetUserPassword extends StatefulWidget {
  @override
  _ResetUserPasswordState createState() => _ResetUserPasswordState();
}

class _ResetUserPasswordState extends State<ResetUserPassword> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Reset User Password'),
          backgroundColor: Colors.red,
        ),
        body: Center(
            child: new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'user@csbsju.edu',
            labelText: 'Email address',
          ),

        ),
        ));
  }
}
