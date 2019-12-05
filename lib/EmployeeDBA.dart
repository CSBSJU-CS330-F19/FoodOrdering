import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeMenuCard.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';

User loggedInUser = getUser();

final databaseReference = Firestore.instance;
DocumentReference docRef = databaseReference.collection('Cart').document('UID');
class EmpDBAState extends StatefulWidget{
  EmpDBAState({@required this.collection});
  final collection;
  @override
  EmployeeDBA createState() {
    return EmployeeDBA(collection: collection);
  }
}

class EmployeeDBA extends State<EmpDBAState> {
  EmployeeDBA({@required this.collection});
  final collection;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(collection).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new Emp(
                  title: document['name'],
                  price: document['price'],
                  inStock: document['inStock'],
                  doc: document.documentID,
                  col: collection
                );
              }).toList(),
            );
        }
      },
    );
  }

  void createRecord(
      String userName, List<String> itemName, List itemPrice) async {
    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'names': FieldValue.arrayUnion(itemName)});

    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'prices': FieldValue.arrayUnion(itemPrice)});
  }
}

/*
void createRecord(String userName, List<String> itemName, List itemPrice) async{
  await databaseReference.collection("Cart").document("1EKuk8X7W9WNfXp7iXQn")
      .add({
    'user': userName,
    'names': itemName,
    'prices': itemPrice
  });
}

 */
