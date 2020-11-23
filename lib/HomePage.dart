import 'package:charm/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:charm/components/horizontal_listview.dart';
import 'package:charm/components/Products.dart';
import 'package:charm/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/m2.jpg'),
          AssetImage('assets/images/m1.jpeg'),
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/w1.jpeg'),
          AssetImage('assets/images/w3.jpeg'),
          AssetImage('assets/images/w4.jpeg'),
        ],
        autoplay: true,
        autoplayDuration: Duration(seconds: 3),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 8.0,
        dotColor: Color(0xffF27405),
        dotBgColor: Colors.transparent,
        dotIncreasedColor: Color(0xffF25C05),
        overlayShadow: true,
        overlayShadowColors: Colors.white,
        overlayShadowSize: 0.5,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0.0),
          )
        ),
        centerTitle: false,
        title: Text('SwagBox',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,size: 30.0,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,size: 30.0,), onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
          }),
          SizedBox(width: 20.0,)
        ],
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
                accountName: Text('Skkarrty'),
                accountEmail: Text('skkarrty@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,size: 50.0,),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.orange,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.deepOrangeAccent,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.deepOrange),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.redAccent),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.green,),
              ),
            ),
            InkWell(
              onTap: () async {
                await _auth.signOut();
                await AuthService().signOutGoogle();
              },
              child: ListTile(
                title: Text('Exit'),
                leading: Icon(Icons.exit_to_app, color: Colors.brown,),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          image_carousel,
          new Padding(padding: const EdgeInsets.all(10.0),
          child: new Text('Categories', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
          ),
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Recent', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
          ),
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
