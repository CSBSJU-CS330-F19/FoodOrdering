import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/CustomCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBA extends StatelessWidget {
  DBA({@required this.collection});
  final collection;

  final databaseReference = Firestore.instance;

  Function onChanged(bool newVal) {
    newVal = !newVal;
  }

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
                  name: document['name'],
                  price: document['price'],
                  customCheese: document['hasCheese'],
                  customVeg: document['hasVegetables'],
                  cheese: document['Cheese'],
                  vegetables: document['Vegetables'],
                );
              }).toList(),
            );
        }
      },
    );
  }

  void createRecord(
      String userName, List<String> itemName, List itemPrice, List<bool> itemHasCheese, List<bool> itemHasVeg, List<List<Object>> cheeses, List<List<Object>> vegetables) async {
    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'names': FieldValue.arrayUnion(itemName)});

    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'prices': FieldValue.arrayUnion(itemPrice)});

    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'hasCheese': FieldValue.arrayUnion(itemHasCheese)});

    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'hasVegetables': FieldValue.arrayUnion(itemHasVeg)});

    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'Cheese': FieldValue.arrayUnion(cheeses)});

    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'Vegetables': FieldValue.arrayUnion(vegetables)});
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
