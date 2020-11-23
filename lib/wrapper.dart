import 'package:charm/HomePage.dart';
import 'package:charm/Services/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charm/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return home or authenticate
    if (user==null){
      return Authenticate();
    }else{
      return HomePage();
    }
  }
}
