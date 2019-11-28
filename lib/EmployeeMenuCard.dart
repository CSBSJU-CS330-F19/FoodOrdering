import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeDBA.dart';
import 'package:mcglynns_food2go/User.dart';
import 'package:mcglynns_food2go/Home.dart';

class EmployeeMenuCard extends StatelessWidget {
  EmployeeMenuCard({@required this.title, this.price, this.uid});
 final _formKey = GlobalKey<FormState>();
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
                ButtonBar(
                    children: <Widget> [
                  FlatButton(
                    child: Text("Edit " + title),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      showDialog(context: context,
                        builder: (BuildContext context) {
                        return AlertDialog(
                          content: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget> [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Submit"),
                              onPressed: () {
                                if(_formKey.currentState.validate()){
                                  _formKey.currentState.save();
                                }
                              },
                            ),
                                )
                              ],
                            ),
                          ),
                        );
                        });


                    },
                  ),
                      FlatButton(
                        child: Text('Remove item'),
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          debugPrint("delete");
                        },
                      ),
                ])
              ],
            )));
  }
}
