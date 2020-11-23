import 'package:charm/LogIn.dart';
import 'package:charm/Register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool ShowSignIn = true;
  void toggleView(){
    setState(() {
      ShowSignIn = !ShowSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
   if(ShowSignIn){
     return Login(toggleView: toggleView);
   }else{
     return Register(toggleView: toggleView);
   }
  }
}
