import 'package:charm/components/cart_product.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}


class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0.0),
            )
        ),
        centerTitle: false,
        title: Text('Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        actions: <Widget>[
          ],
      ),
      body: new Cart_products(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(child: ListTile(
              title: new Text("Total"),
              subtitle: new Text("\$0"),
            ),),
            Expanded(
              child: new MaterialButton(onPressed: (){},
              child: new Text("Check Out", style: TextStyle(color: Colors.white),),
              color: Colors.red,),
            ),
            SizedBox(
              width: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
