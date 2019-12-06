import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/DBA.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';
import 'package:mcglynns_food2go/DeliOrder.dart';

class DeliCustomCard extends StatefulWidget {
  DeliCustomCard({@required this.title, this.price, this.uid, this.inStock});

  final uid;
  final title;
  final price;
  final inStock;

  @override
  _StateDeliCustomCard createState() {
    return _StateDeliCustomCard(title: title, price: price, uid: uid, inStock: inStock);
  }
}

class _StateDeliCustomCard extends State<DeliCustomCard>{
  _StateDeliCustomCard({@required this.title, this.price, this.uid, this.inStock});
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
                ButtonTheme.bar(
                    child: ButtonBar(children: <Widget>[
                      FlatButton(
                        child: Text('Customize Order'),
                        onPressed: () {
                          //dba.createRecord(myUser.uid, [title], [price]);

                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) => new DeliOrder(product: [
                                new Product('American cheese', false),
                                new Product('Chedar cheese', false),
                                new Product('Colby Jack cheese', false),
                                new Product('Colby Jack cheese', false),
                                new Product('Pepper Jack cheese', false),
                                new Product('Swiss cheese', false),
                                new Product('Bacon', false),
                                new Product('Chicken Salad', false),
                                new Product('Grilled Chicken', false),
                                new Product('Ham', false),
                                new Product('Pepperoni', false),
                                new Product('Salami', false),
                                new Product('Smoked Turkey Breast', false),
                                new Product('Tuna Salad', false),
                                new Product('Black Pepper', false),
                                new Product('Honey Mustard', false),
                                new Product('Hummus', false),
                                new Product('Roasted Red Pepper Hummus', false),
                                new Product('Italian Sauce', false),
                                new Product('Mayo', false),
                                new Product('Olive Oil', false),
                                new Product('Pesto Mayo', false),
                                new Product('Ranch', false),
                                new Product('Red Wine Vinegar', false),
                                new Product('Bannana Peppers', false),
                                new Product('Black Olives', false),
                                new Product('Cucumber Slices', false),
                                new Product('Green Peppers', false),
                                new Product('Jalepenos', false),
                                new Product('Pickles', false),
                                new Product('Red Onion', false),
                                new Product('Shredded Lettuce', false),
                                new Product('Spinach', false),
                              ])



                          )
                          );
                        },

                        color: Colors.red,
                        textColor: Colors.white,

                      ),
                    ]))
              ],
            )));
  }
}
