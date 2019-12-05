import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';
import 'package:mcglynns_food2go/DBACart.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage();
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
