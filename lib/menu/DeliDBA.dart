import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/CustomCard.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';


User loggedInUser = getUser();



class DeliDBA extends StatelessWidget {
  DeliDBA();


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("Deli Daily").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
              snapshot.data.documents.map((DocumentSnapshot document) {
                return new CustomDeliCard(
                  title: document['name'],
                  price: document['types'],
                );
              }).toList(),
            );
        }
      },
    );
  }
}

  class CustomDeliCard extends StatelessWidget {
  CustomDeliCard({@required this.title, this.price, this.uid});

  final uid;
  final title;
  final price;



  User myUser = getUser();

  @override
  Widget build(BuildContext context) {
  return Card(
  child: Container(
  padding: const EdgeInsets.only(top: 5.0),
  child: Column(
  children: <Widget>[
  Text(title + "\n Types: " + price.toString()),
  ],
  )));
  }
  }


