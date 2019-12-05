import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeDBA.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';

class EmployeeMenuCard extends StatelessWidget {
  EmployeeMenuCard({@required this.title, this.price, this.uid});

  final uid;
  final title;
  final price;

  final dba = new EmployeeDBA(collection: null);

  User myUser = getUser();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                Text(title),
                ButtonTheme.bar(
                    child: ButtonBar(children: <Widget>[
                  FlatButton(
                    child: Text(title),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Remove item'),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      debugPrint("delete");
                    },
                  ),
                ]))
              ],
            )));
  }
}
