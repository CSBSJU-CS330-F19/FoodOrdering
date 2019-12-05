import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/User.dart';
import 'package:mcglynns_food2go/Home.dart';

class DBACart extends StatelessWidget {
  User myUser = getUser();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection("Cart")
            .document(myUser.getUID())
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          print(Firestore.instance.collection("Cart").snapshots());
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              if (snapshot.data['names'] == null ||
                  snapshot.data['prices'] == null) {
                return new TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "No items in cart"));
              } else if (snapshot.data['names'].length !=
                  snapshot.data['prices'].length) {
                return new TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Uneven number of items and prices"));
              } else {
                return new CustomCartCard(
                  title: snapshot.data['names'],
                  price: snapshot.data['prices'],
                );
              }
          }
        });
  }

  void deleteCart() {
    Firestore.instance
        .collection("Cart")
        .document(myUser.getUID())
        .setData({"names": null, "prices": null});
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
      list.add(
          new Text("  " + title[j] + "\n      " + price[j].toString() + "\n"));
      cartTotal = cartTotal + price[j];
    }
    list.add(new Text("------------------------------\n "
            "Cart Total : \$" +
        cartTotal.toString()));

    return new Column(children: [
      Expanded(
          child: ListView(
        children: list,
      )),
      FlatButton(
        child: Text('Checkout'),
        color: Colors.red,
        textColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                      title: Text("Place Order?"),
                      content: const Text(
                          "This will send your cart information to McGlynn's"),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context, DBACart());
                          },
                        ),
                        FlatButton(
                            child: const Text('Send Order'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => new AlertDialog(
                                          title: Text("Order Placed"),
                                          content: const Text(
                                              "Order had been sent to McGlynn's"),
                                          actions: <Widget>[
                                            FlatButton(
                                                child: const Text("OK"),
                                                onPressed: () {
                                                  Navigator.pop(context,
                                                      DBACart().deleteCart());
                                                  Navigator.pop(
                                                      context, DBACart());
                                                })
                                          ]));
                            })
                      ]));
        },
      ),
    ]);
  }
}
