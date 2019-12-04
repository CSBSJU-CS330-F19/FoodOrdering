import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class ResetUserPassword extends StatefulWidget {
  @override
  _ResetUserPasswordState createState() => _ResetUserPasswordState();
}


class _ResetUserPasswordState extends State<ResetUserPassword> {
  TextEditingController emailController = new TextEditingController();


  Widget _textFields() {
    return Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'Email address on your account', hintText: 'user@csbsju.edu',),
          ),

        ]
    );
  }

// These are the Save and Cancel buttons
  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () {
                resetPassword(emailController.text);
                Fluttertoast.showToast(msg: "Please check your email", toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Send Reset Password Email",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Reset User Password'),
          backgroundColor: Colors.red,
        ),
        body: Stack(
          children: <Widget>[
            SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: screenSize.height / 6.4),
                        _textFields(),
                        _buildButtons()
                      ],
                    )
                )
            )
          ],
        )
    );
  }
}

Future<void> resetPassword(String email) async {
  await _firebaseAuth.sendPasswordResetEmail(email: email);
}