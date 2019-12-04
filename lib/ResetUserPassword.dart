import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class ResetUserPasswordls extends StatefulWidget {
  @override
  _ResetUserPasswordStatels createState() => _ResetUserPasswordStatels();
}

class _ResetUserPasswordStatels extends State<ResetUserPasswordls> {
  TextEditingController emailController = new TextEditingController();

  @override
  initState() {
    emailController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  Widget _textFields() {
    return Column(children: <Widget>[
      TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Email address on your account',
          hintText: 'user@csbsju.edu',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: emailValidator,
      ),
    ]);
  }

// These are the Save and Cancel buttons
  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () {
                if (emailController.text == "") {
                  Fluttertoast.showToast(
                      msg: "No email address provided. Please enter an email.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER);
                } else {
                  Fluttertoast.showToast(
                      msg: "If an account is registered with email \""+emailController.text+"\", a reset password link has been sent to that email.\n\nPlease check your email.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER);
                  resetPassword(emailController.text);
                }
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
                SizedBox(
                  height: screenSize.height / 6.4,
                  width: 100,
                ),
                _textFields(),
                _buildButtons()
              ],
            )))
          ],
        ));
  }
}

Future<void> resetPassword(String email) async {
  await _firebaseAuth.sendPasswordResetEmail(email: email);
}
