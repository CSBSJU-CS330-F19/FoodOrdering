import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeDBA.dart';
import 'package:mcglynns_food2go/Home.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class Emp extends StatefulWidget{
  Emp({@required this.title, this.price, this.doc, this.col, this.inStock});
  final doc;
  final title;
  final price;
  final col;
  final inStock;
  @override
  EmployeeMenuCard createState() {
   return EmployeeMenuCard(title: title, price: price, doc: doc, col: col, inStock: inStock);
  }
}

class EmployeeMenuCard extends State<Emp> {
  EmployeeMenuCard({@required this.title, this.price, this.doc, this.col, this.inStock});

  final col;
  final doc;
  final title;
  final price;
  final inStock;

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
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Remove item'),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {

                      showDialog(context: context,
                        builder: (BuildContext context) {
                        return MyDialog(doc: doc, col: col, inStock: inStock);
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

class MyDialog extends StatefulWidget{
  MyDialog({@required this.doc, this.col, this.inStock});
  final col;
  final doc;
  final inStock;


  @override
  _MyDialogState createState() => new _MyDialogState(doc: doc, col: col, inStock: inStock);
}

class _MyDialogState extends State<MyDialog> {
  _MyDialogState({@required this.doc, this.col, this.inStock});
  final doc;
  final col;
  bool inStock;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController;
  TextEditingController priceController;

  @override
  initState(){
    nameController = new TextEditingController();
    priceController = new TextEditingController();

    super.initState();
  }


  @override
  Widget build(BuildContext context){

    return AlertDialog(

      content: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget> [
            Container(
              padding: EdgeInsets.all(8.0),


              child: TextFormField(
                controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Enter new name of item'
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: priceController,
                  decoration: InputDecoration(
                      labelText: 'Enter new price of item'
                  )
              ),
            ),
            Container(
                padding: EdgeInsets.all(8.0),

                child: Text("In Stock")
            ),
            Container(
              padding: EdgeInsets.all(8.0),
             height: 50,
              child: Switch(
                value: inStock,
                onChanged: (bool newValue){
                  setState((){
                    inStock = newValue;
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              height: 50,
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  if(nameController){

                  }
                  if(_formKey.currentState.validate()){
                    print("this is doc: " + doc);
                    Firestore.instance.collection(col).document(doc).updateData({
                      "name": nameController.text,
                      "price": int.parse(priceController.text),
                      "inStock": inStock
                    });
                    Navigator.pop(context);

                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}