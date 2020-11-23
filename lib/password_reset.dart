import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:charm/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:charm/widget/wave_widgets.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  bool invisible = true;

  var _controller1 = TextEditingController();

  String _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom>0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                    'Reset Password', style: TextStyle(
                  fontSize: 35.0,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextFormField(
                    autovalidate: true,
                    controller: _controller1,
                    onSaved: (input)=>_email = input,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: IconButton(
                          icon: Icon(Icons.mail_outline,size: 18,color: Colors.deepOrangeAccent,),
                          onPressed: ()=> _controller1.clear(),
                        ),
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
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: RaisedButton(
                      onPressed:() {resetPassword(_email);},
                      child: Text('Send Mail',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),),
                      color: Colors.deepOrange,
                      disabledColor: Colors.deepOrangeAccent,
                      highlightColor: Colors.deepOrangeAccent,
                      highlightElevation: 0.0,
                      splashColor: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: RaisedButton(
                      child: Text('Back',style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),),
                      color: Colors.white,
                      disabledColor: Colors.grey,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      highlightColor: Colors.white10,
                      highlightElevation: 0.0,
                      splashColor: Colors.white10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Future<void> resetPassword(String email) async {
    final formState = _formKey.currentState;
    formState.save();
    try
    {await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);}
    catch(e){
      print(e.message);
    }
  }
}

