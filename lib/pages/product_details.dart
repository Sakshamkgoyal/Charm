import 'package:charm/pages/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charm/HomePage.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0.0),
            )
        ),
        centerTitle: false,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
          },
          child: Text(widget.product_detail_name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,size: 30.0,), onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
          }),
          SizedBox(width: 20.0,)
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.product_detail_name,style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("₹${widget.product_detail_old_price}", style:
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),),
                      ),
                      Expanded(
                        child: new Text("₹${widget.product_detail_new_price}",style:
                          TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Size"),
                        content: new Text("Choose the size"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Icon(Icons.clear, color: Colors.deepOrange,),
                          ),
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text('Size', style: TextStyle(
                          fontSize: 20.0,
                        ),),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down, size: 30.0,),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Choose the Color"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: new Icon(Icons.clear, color: Colors.deepOrange,),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text('Color', style: TextStyle(
                          fontSize: 20.0,
                        ),),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down, size: 30.0,),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose the Quantity"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: new Icon(Icons.clear, color: Colors.deepOrange,),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text('Qty', style: TextStyle(
                          fontSize: 20.0,
                        ),),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down, size: 30.0,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text("Buy Now", style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  )
                ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.deepOrange,), onPressed: (){

              }),
              new IconButton(icon: Icon(Icons.favorite_border, color: Colors.deepOrange), onPressed: null),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non fringilla lorem, vehicula porta sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus mollis, est vitae pellentesque dignissim, mi urna ornare elit, eget ultrices turpis lectus vel odio. Nulla faucibus in ante egestas congue. Mauris quis leo dolor. Etiam et tortor quis nibh hendrerit gravida. Nullam sollicitudin sed dui quis hendrerit. Fusce posuere ac quam et rhoncus. Morbi blandit ex id nisl feugiat volutpat. Integer quis bibendum velit, in mollis neque. "),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Name", style: TextStyle(
                    color: Colors.grey,
                )),
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text("Product Brand", style: TextStyle(
                    color: Colors.grey,
                  ))
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand x"),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text("Product Condition", style: TextStyle(
                    color: Colors.grey,
                  ))
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("New"),
              )
            ],
          ),
          Divider(),
          new Text("   Similar Products", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),),
          Container(
            height: 360.0,
            child: Similar_products(),
          ),
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name":"Male Blazer",
      "picture":"assets/images/products/blazer1.jpeg",
      "old_price": 700,
      "price": 500,
    },
    {
      "name":"Female Blazer",
      "picture":"assets/images/products/blazer2.jpeg",
      "old_price": 700,
      "price": 500,
    },
    {
      "name":"Red Dress",
      "picture":"assets/images/products/dress1.jpeg",
      "old_price": 700,
      "price": 500,
    },
    {
      "name":"Black Dress",
      "picture":"assets/images/products/dress2.jpeg",
      "old_price": 700,
      "price": 500,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index){
        return similar_prod(
          product_name: product_list[index]['name'],
          product_picture: product_list[index]['picture'],
          product_old_price: product_list[index]['old_price'],
          product_price: product_list[index]['price'],
        );
      },
    );
  }
}


class similar_prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  similar_prod({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: product_name,
        child: Material(
          child: InkWell(
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ProductDetails(
              product_detail_name: product_name,
              product_detail_new_price: product_price,
              product_detail_old_price: product_old_price,
              product_detail_picture: product_picture,
            ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(product_name, style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  title: Text("\₹$product_price",style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),),
                  subtitle: Text("\₹$product_old_price",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),),
                ),
              ),
              child: Image.asset(product_picture,
                fit: BoxFit.cover,),
            ),
          ),
        ),),
    );
  }
}


