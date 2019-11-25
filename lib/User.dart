import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class User
{
  String uid;
  String email;
  String fname;
  String surname;
  bool employee;
  var doc;
  User(String this.uid){
  doc= Firestore.instance.collection('users').document(uid);
  doc.get().then((DocumentSnapshot ds) {
    this.email = ds['email'];
    this.employee = ds['employee'];
    this.fname = ds['fname'];
    this.surname = ds['surname'];
  });
  }

  String getUID(){
    return this.uid;
  }

  String getFName(){
    return this.fname;
  }
  String getSurName(){
    return this.surname;
  }
  bool getEmployee(){
    return this.employee;
  }
  String getEmail() {
    return this.email;
  }
  String getFullName() {
    return this.fname + " " + this.surname;
  }
  void setFName(String name){
    doc.updateData({"fname" : name});
  }
  void setSurName(String name){

    doc.updateData({"surname" : name});
  }
  void setEmployee(bool emp){
     doc.updateData({"employee" : emp});
  }
  void setEmail(String newEmail){
    doc.updateData({"email" : newEmail});
  }

  getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

}