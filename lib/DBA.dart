import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/CustomCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBA extends StatelessWidget {
  DBA({@required this.collection});
  final collection;

  final databaseReference = Firestore.instance;





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
                return new CustomCard(
                  title: document['name'],
                  price: document['price'],
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
