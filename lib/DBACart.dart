

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'dart:async';
import 'package:mcglynns_food2go/User.dart';

class DBACart extends StatelessWidget {
  User myUser = getUser();

  User myUser = getUser();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance.collection("Cart").document(myUser.getUID()).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        print(Firestore.instance.collection("Cart").snapshots());
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new CustomCartCard(
              title: snapshot.data['names'],
              price: snapshot.data['prices'],
            );
        }});
    }
}






class CustomCartCard extends StatelessWidget {
  CustomCartCard({@required this.title, this.price});

  final title;
  final price;
  var cartTotal = 0.0;




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