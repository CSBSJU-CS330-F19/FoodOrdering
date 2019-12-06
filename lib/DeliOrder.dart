import 'package:flutter/material.dart';


class DeliOrder extends StatefulWidget {
  DeliOrder({Key key, this.product}) : super(key: key);
  final List<Product> product;
  @override
  _DeliOrderState createState() {
    return new _DeliOrderState();
  }
}
class _DeliOrderState extends State<DeliOrder> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Ingedients"),
          backgroundColor: Colors.red,
        ),
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(
                  child: new ListView(
                    padding: new EdgeInsets.symmetric(vertical: 8.0),
                    children: widget.product.map((Product product) {
                      return new ShoppingItemList(product);
                    }).toList(),
                  )),
              new RaisedButton(
                onPressed: () {
                  for (Product p in widget.product) {
                    if (p.isCheck) print(p.name);
                  }
                },
                child: new Text('Place Order'),
                color: Colors.red,
                textColor: Colors.white,
              )
            ],
          ),
        ));
  }
}
class ShoppingItemList extends StatefulWidget {
  final Product product;
  ShoppingItemList(Product product)
      : product = product,
        super(key: new ObjectKey(product));
  @override
  ShoppingItemState createState() {
    return new ShoppingItemState(product);
  }
}
class ShoppingItemState extends State<ShoppingItemList> {
  final Product product;
  ShoppingItemState(this.product);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(product.name)),
            new Checkbox(
                value: product.isCheck,
                onChanged: (bool value) {
                  setState(() {
                    product.isCheck = value;
                  });
                })
          ],
        ));
  }
}

class Product {
  String name;
  bool isCheck;
  Product(this.name, this.isCheck);
}