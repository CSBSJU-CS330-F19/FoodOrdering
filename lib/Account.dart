import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Account'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(child: new Text('I am the account page')),
    );
  }
}
