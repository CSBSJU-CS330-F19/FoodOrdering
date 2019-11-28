import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';
import 'package:mcglynns_food2go/User.dart';
import 'package:mcglynns_food2go/Home.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.title, this.price, this.uid});

  final uid;
  final title;
  final price;

  final dba = new DBA(collection: null);

  User myUser = getUser();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                Text(title + "\n Price: " + price.toString()),
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
