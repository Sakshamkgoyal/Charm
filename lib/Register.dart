import 'package:charm/LogIn.dart';
import 'package:charm/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:charm/widget/wave_widgets.dart';
import 'package:charm/password_reset.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String confirmPaasword = '';

  @override
  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom>0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: size.height - 200,
            color: Colors.deepOrange,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds:500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height/3.7:0.0,
            child: WaveWidget(
              size: size,
              yoffset: size.height/3.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up', style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val)=>val.isEmpty ? 'Enter an Email':null,
                        onChanged: (val){
                          email = val;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.mail_outline,
                              size: 18,
                              color: Colors.deepOrangeAccent,),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepOrangeAccent),
                                borderRadius: BorderRadius.circular((10))
                            ),
                            labelStyle: TextStyle(color: Colors.deepOrangeAccent)
                        ),
                        obscureText: false,
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        validator: (val)=>val.length < 6 ? 'Enter a password 6+ char long':null,
                        onChanged: (val){
                          password = val;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.mail_outline,
                              size: 18,
                              color: Colors.deepOrangeAccent,),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepOrangeAccent),
                                borderRadius: BorderRadius.circular((10))
                            ),
                            labelStyle: TextStyle(color: Colors.deepOrangeAccent)
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormField(
                            validator: (val)=>val.length < 6 ? 'Enter a password 6+ char long':null,
                            onChanged: (val){
                              confirmPaasword = val;
                            },
                            autovalidate: true,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                prefixIcon: Icon(Icons.lock_outline,
                                  size: 18,
                                  color: Colors.deepOrangeAccent,),
                                filled: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                                    borderRadius: BorderRadius.circular((10))
                                ),
                                labelStyle: TextStyle(color: Colors.deepOrangeAccent)
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 5.0),
                          GestureDetector (
                            onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>Password()));},
                            child: Text('Forgot Password?', style: TextStyle(
                              color: Colors.deepOrange,
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 60.0,
                        child: RaisedButton(
                          child: Text('Sign Up',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),),
                          color: Colors.deepOrange,
                          disabledColor: Colors.deepOrangeAccent,
                          onPressed: () async {
                            if (_formKey.currentState.validate()){
                              if(password == confirmPaasword){
                                dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                if(result == null){
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text('Please Enter Valid Email'),
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.deepOrangeAccent,
                                      ));

                                }else{
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                                }
                              }else{
                                _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text('Password does not match'),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.deepOrangeAccent,
                                    ));
                              }
                            }
                          },
                          highlightColor: Colors.deepOrangeAccent,
                          highlightElevation: 0.0,
                          splashColor: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 60.0,
                        child: RaisedButton(
                          child: Text('Sign In',style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),),
                          color: Colors.white,
                          disabledColor: Colors.grey,
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                          },
                          highlightColor: Colors.white10,
                          highlightElevation: 0.0,
                          splashColor: Colors.white10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                        ),
                      ),
                      Divider(),
                      RaisedButton(
                        child: Image.asset('assets/images/Google.png', height: 50.0, width: 50.0,),
                        shape: CircleBorder(),
                        color: Colors.white,
                        disabledColor: Colors.grey,
                        onPressed: () async {
                          dynamic result = await AuthService().signInWithGoogle();
                          if(result == null){
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text('Please Enter Valid Email'),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.deepOrangeAccent,
                                ));
                          }

                        },
                        highlightColor: Colors.white10,
                        highlightElevation: 0.0,
                        splashColor: Colors.white10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
