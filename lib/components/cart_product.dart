import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name":"Male Blazer",
      "picture":"assets/images/products/blazer1.jpeg",
      "price": 500,
      "size": "M",
      "Color": "Black",
      "quantity": 1,
    },
    {
      "name":"Female Blazer",
      "picture":"assets/images/products/blazer2.jpeg",
      "price": 500,
      "size": "M",
      "Color": "Black",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (BuildContext context,int index){
        return Single_cart_product(
          cart_product_name: Products_on_the_cart[index]["name"],
          cart_product_color: Products_on_the_cart[index]["Color"],
          cart_product_picture: Products_on_the_cart[index]["picture"],
          cart_product_price: Products_on_the_cart[index]["price"],
          cart_product_qty: Products_on_the_cart[index]["quantity"],
          cart_product_size: Products_on_the_cart[index]["size"],
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;

  const Single_cart_product({Key key,
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      ListTile(
        leading: new Image.asset(cart_product_picture, width: 100.0, height: 100.0,),
        title: new Text(cart_product_name, style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Size"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(cart_product_size, style: TextStyle(color: Colors.red),),
                  ),
                new Padding(padding: const EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
                child: new Text("color"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(cart_product_color, style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text("₹$cart_product_price", style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),),
            )
          ],
        ),
          trailing: new Column(
              children: <Widget>[
                Expanded(child: new Text("$cart_product_qty"),),
                Expanded(child:new IconButton(icon: Icon(Icons.remove_shopping_cart), onPressed: null),),
                SizedBox(height: 5.0,),
              ]
          )
      ),

    );
  }
}
