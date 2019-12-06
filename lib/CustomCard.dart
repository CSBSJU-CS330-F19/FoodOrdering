import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';

class CustomCard extends StatefulWidget {
  CustomCard({@required this.title, this.price, this.uid, this.inStock});

  final uid;
  final title;
  final price;
  final inStock;

  @override
  _StateCustomCard createState() {
    return _StateCustomCard(title: title, price: price, uid: uid, inStock: inStock);
  }
}

class _StateCustomCard extends State<CustomCard>{
  _StateCustomCard({@required this.title, this.price, this.uid, this.inStock});
  final uid;
  final title;
  final price;
  final inStock;
  final dba = new DBA(collection: null);

  User myUser = getUser();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                Text(title + "\n Price: " + price.toString() + "\n In Stock: " + inStock.toString()),
                ButtonBar(
                  children: <Widget>[
                  FlatButton(
                    child: Text('Add to Cart'),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      dba.createRecord(myUser.uid, [title], [price]);
                    },
                  ),
                ])
              ],
            )));
  }
}
