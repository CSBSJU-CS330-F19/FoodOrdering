import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}
User myUser = getUser();

class _AccountState extends State<Account> {


  TextEditingController nameController = new TextEditingController(text: myUser.getFName());
  TextEditingController surnameController = new TextEditingController(text: myUser.getSurName());
  TextEditingController emailController = new TextEditingController(text: myUser.getEmail());

  // User _currentUser;
  //_AccountState(var uid) {
  //  _currentUser = new User(uid);
  // }
  // This is where you have the text fields that will display ur info on ur account
  Widget _textFields() {
    return Column(children: <Widget>[
      TextFormField(
        controller: nameController,
        decoration: InputDecoration(
            labelText: 'First Name*', hintText: myUser.getFName()),
        //                labelText: 'First Name*', helperText: _currentUser.getFName()),

      ),
      TextFormField(
        controller: surnameController,
        decoration: InputDecoration(
            labelText: 'Last Name*', hintText: myUser.getSurName()),
      ),
      TextFormField(
        controller: emailController,
        decoration:
            InputDecoration(labelText: 'Email*', hintText: myUser.getEmail()),
      ),
      FlatButton(
        child: Text('Reset Password'),
        color: Colors.red,
        textColor: Colors.white,
        onPressed: () {
          Fluttertoast.showToast(
              msg: "A reset password link has been sent your email.\n\nPlease check your email.",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER);
          resetPassword(myUser.getEmail());
        },
      ),
    ]);
  }

// These are the Save and Cancel buttons
  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push();
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () {
                myUser.setFName(nameController.text);
                myUser.setSurName(surnameController.text);
                myUser.setEmail(emailController.text);
                 Navigator.of(context).pop();
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
                      "Save",
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
          title: new Text('Account Settings'),
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
            )))
          ],
        ));
  }
}

Future<void> resetPassword(String email) async {
  await _firebaseAuth.sendPasswordResetEmail(email: email);
}
