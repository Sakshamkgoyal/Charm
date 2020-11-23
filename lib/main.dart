import 'dart:async';
import 'package:charm/models/user.dart';
import 'package:charm/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.deepOrange, accentColor: Colors.deepOrangeAccent, cursorColor: Colors.deepOrange,),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Wrapper())));
 }
  @override
  Widget build(BuildContext context) {
      return Container(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(decoration: BoxDecoration(color: Color(0xffBF2604)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 100.0,
                            child: Icon(
                              Icons.shopping_cart,
                              color: Color(0xffF27405),
                              size: 100.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          Text(
                            'SwagBox',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 30.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 20.0),
                        ),
                        Text("One stop for all young studs", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}
