import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';


class CustomCard extends StatefulWidget {
  CustomCard({@required this.name, this.price, this.uid, this.customCheese, this.customVeg, this.cheese, this.vegetables});

  final uid;
  final name;
  final price;
  final inStock;
  final customCheese;
  final customVeg;
  List<Object> cheese;
  List<Object> vegetables;
  
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

  Widget hasTitle(bool boolVal, String myTitle) {
    if (boolVal) {
      return Text(myTitle);
    }
    else {
      return Container();
    }
  }

  List<bool> initBoolVals(bool dependent, int length) {
    List<bool> vals = [];
    if (dependent) {
      vals.add(true);
      for (int i = 0; i < length-1; i++) {
        vals.add(false);
      }
    }
    else {
      for (int i = 0; i < length; i++) {
        vals.add(false);
      }
    }
    return vals;
  }

  void changeDepVals(List<bool> vals, int indexOfTrue) {
    for (int i = 0; i < vals.length; i++) {
      if (i == indexOfTrue) {
        vals.removeAt(i);
        vals.insert(i, true);
      }
      else {
        vals.removeAt(i);
        vals.insert(i, false);
      }
    }
  }

  void changeIndVals(List<bool> vals, int indexOfSelected) {
    for (int i = 0; i < vals.length; i++) {
      if (i == indexOfSelected) {
        if (vals.elementAt(i) == true) {
          vals.removeAt(i);
          vals.insert(i, false);
        }
        else {
          vals.removeAt(i);
          vals.insert(i, true);
        }
      }
    }
  }

  void changeVals(List<bool> vals, int index, bool isDependent) {
    if (isDependent) {
      changeDepVals(vals, index);
    }
    else {
      changeIndVals(vals, index);
    }
  }

  Container checkbox(String itemName, List<bool> itemValues, int index, bool isDependent) {
    return new Container(
      padding: const EdgeInsets.all(21.0),
      constraints: BoxConstraints(maxWidth: 210.0),
      child: new CheckboxListTile(
          title: new Text(itemName),
          value: itemValues.elementAt(index),
          onChanged: (bool newVal) {
            changeVals(itemValues, index, isDependent);
          }
          ),
    );
  }

  Column checkColumn(List<Object> items, List<bool> vals, bool isDependent) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      for (int i = 0; i < items.length; i++)
        checkbox(items.elementAt(i), vals, i, isDependent)
      ],
    );
  }

  Column hasColumn(bool rowVal, List<Object> items, List<bool> boolVals, bool isDependent) {
    if (rowVal) {
      return checkColumn(items, boolVals, isDependent);
    }
    else {
      return Column();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                Text(title + "\n Price: " + price.toString() + "\n In Stock: " + inStock.toString()),
                hasTitle(customCheese, "Cheese"),
                hasColumn(customCheese, cheese, initBoolVals(true, cheese.length), true),
                hasTitle(customVeg, "Vegetables"),
                hasColumn(customVeg, vegetables, initBoolVals(false, vegetables.length), false),
                ButtonBar(
                  children: <Widget>[
                  FlatButton(
                    child: Text('Add to Cart'),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      dba.createRecord(myUser.uid, [name], [price], [customCheese], [customVeg], [cheese], [vegetables]);
                    },
                  ),
                ])
              ],
            )));
  }
}
