
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:manufacturer/Signup.dart';
import 'package:manufacturer/screens/main_page.dart';

class LoginX extends StatefulWidget {
  @override
  _LoginXState createState() => _LoginXState();
}

class _LoginXState extends State<LoginX> {
  bool eye = true;
  String _email,_password;
 FirebaseAuth auth = FirebaseAuth.instance;
  void _toggle() {
    setState(() {
      eye = !eye;
    });
  }
    Future validateAndSubmit () async {
      try{
        
        var user =  await auth.signInWithEmailAndPassword(email: _email, password: _password);

        if(user!=null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
        }
    
      }
      catch (e){
        print("User not signed in" + e.toString());
        // Firestore firestore = Firestore 
      }
    
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
            child: new FlatButton(
              child: new Text(
                "Sign up",
                style: new TextStyle(color: Colors.grey, fontSize: 17),
              ),
              onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
              },
              highlightColor: Colors.black,
              shape: StadiumBorder(),
            ),
          ),
        ],
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Text(
                "Log in",
                style: new TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              new SizedBox(
                height: 70,
              ),
              new TextField(
                
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: new InputDecoration(
                  // hintText: "Email",
                  labelText: "Email",
                ),
                onChanged: (value){
                  _email = value;
       
                },
              ),
              new SizedBox(
                height: 30,
              ),
              new TextField(
                onChanged: (value){
                  _password = value;
            

                },
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: new InputDecoration(
                  labelText: "Password",
                  suffixIcon: new GestureDetector(
                    child: new Icon(
                      Icons.remove_red_eye,
                    ),
                    onTap: _toggle,
                  ),
                ),
                obscureText: eye,
              ),
              new SizedBox(
                height: 30,
              ),
              new SizedBox(
                height: 50,
                child: new RaisedButton(
                  child: new Text("Log in",
                      style: new TextStyle(color: Colors.white)),
                  color: Colors.blueGrey,
                  elevation: 15.0,
                  shape: StadiumBorder(),
                  splashColor: Colors.white54,
                  onPressed: () {
                    validateAndSubmit();
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainWidget()));
                  },
                ),
              ),
              new Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: new Text(
                  "Or sign in with social account",
                  textAlign: TextAlign.center,
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 100,
                    child: new OutlineButton(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            
                            FontAwesomeIcons.google,
                            size: 20,
                          ),
                          new SizedBox(
                            width: 5,
                          ),
                          new Text("Sign In with Google",
                              style: new TextStyle(color: Colors.black)),
                        ],
                      ),
                      shape: StadiumBorder(),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                 
                ],
              ),
              new SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}