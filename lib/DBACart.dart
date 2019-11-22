import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/CustomCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'dart:async';
import 'package:mcglynns_food2go/User.dart';

class DBACart extends StatelessWidget {



  DBACart({@required this.collection});
  final collection;

  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(collection).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        print(Firestore.instance.collection(collection).snapshots());
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                    return new CustomCartCard(
                      title: document['names'],
                      price: document['prices'],
                    );
              }).toList(),
            );
        }
      },
    );
  }
}

class CustomCartCard extends StatelessWidget {
  CustomCartCard({@required this.title, this.price});

  final title;
  final price;

  final dba = new DBACart(collection: null);
  var cartTotal = 0.0;


  User myUser = getUser();

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    for (var j = 0; j < title.length; j++) {
      list.add(new Text("  " + title[j] + "\n      " + price[j].toString() + "\n"));
      cartTotal = cartTotal + price[j];
    }
    list.add(new Text("Cart Total : \$" + cartTotal.toString()));

     return new Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: list
     );
  }
}