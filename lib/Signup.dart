import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:manufacturer/DrawerItems.dart';
class SignupPage extends StatefulWidget {


  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  bool obsureTextValue = true;
  File image;

  
  void _ChangeText(){
    setState(() {
     if(obsureTextValue){
       obsureTextValue = false;

     }
     else{
       obsureTextValue = true;

     }
    });
  }
  
  String _fullName,_email,_password,_phoneNum,_address,_cnic;

  final _formKey = new GlobalKey<FormState>();
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

bool validateAndSave() {



    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print("Form is valid");
        return true;
    }
    return false;
  }


  Future validateAndSubmit () async {
    
    if (true){
      try {
    //  AuthResult authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password:_password);
                     
          FirebaseUser _user =  (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password:_password)) as FirebaseUser;

    
        // Firestore _firestore = Firestore.instance;
      if(_user!=null){
        Firestore _firestore = Firestore.instance;
        _firestore.collection("Manufacturer").document(_user.uid).setData(
        {"Email": _email,
        "Full Name": _fullName,
        "Phone": _phoneNum,
        "Address":_address,
        "CNIC":_cnic
      });
  
  
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainWidget()));
      }
   

          }
          catch (e){
    
            print("User not created " + e.toString());
            // _scaffoldKey.currentState.showSnackBar(
            //     SnackBar(
            //       content: new Text(e.toString()),
            //       duration: new Duration(seconds: 10),
            //     ));
        }
        }
    
      }
    
    
    Color backgroundColor = Color(0xff10477d);
    
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: false,
            body:  new Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
    
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: 
                <Widget>[
                // Container(
                //   child: Stack(
                //     children: <Widget>[
                //       Container(
                //         padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                //         child: Text(
                //           'Signup',
                //           style:
                //               TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       Container(
                //         padding: EdgeInsets.fromLTRB(150.0, 40.0, 0, 0.0),
                //         child: Text(
                //           '.',
                //           style: TextStyle(
                //               fontSize: 80.0,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.green),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                ),
                Container(
                  child:  Center(
                    child: GestureDetector(
                        
                        onTap: picker,
                        child: CircleAvatar(
                        radius: 70.0,
                        backgroundImage: image == null ? NetworkImage('https://cdn2.iconfinder.com/data/icons/user-management/512/add-512.png'): FileImage(image),
                          ),
                    ),
                      ),
                    ),
                          
                                      Container(
                                          padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                                          child: Column(
                                            children: <Widget>[

                                          TextField(
                                            
                                                  // controller: _firstName,
                                                  onChanged: (String fullname){
                                                    _fullName= fullname;
                                                  
                                                  },
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    hintText: "Enter First Name",
                                                    ),

                                            ),
                                              // TextFormField(

                                              //   keyboardType: TextInputType.text,
                                              //   validator: (input) => input.isEmpty ? 'Name cannot be empty' : null,
                                                  
                                              //     onSaved: (input){

                                              //       _fullName= input;
                                              //     },
                                              //   decoration: InputDecoration(
                                              //     labelText: 'FULL NAME ',
                                              //       labelStyle: TextStyle(
                                              //           fontFamily: 'Montserrat',
                                              //           fontWeight: FontWeight.bold,
                                              //           color: Colors.grey),
                                              //       focusedBorder: UnderlineInputBorder(
                                              //           borderSide: BorderSide(color: Colors.green))),
                                                    
                                                    
                                              // ),
                                              SizedBox(height: 10.0),
                                              TextField(
                      // controller: _firstName,
                                                  onChanged: (String email){
                                                    _email= email;
                                                  },
                                                  keyboardType: TextInputType.emailAddress,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    hintText: "Email",
                                                    ),

                                            ),
                                              SizedBox(height: 10.0),
                                              TextField(
                      // controller: _firstName,
                                                        onChanged: (String password){
                                                          _password= password;
                                                      
                                                        },
                                                        keyboardType: TextInputType.text,
                                                        decoration: InputDecoration(
                                                          fillColor: Colors.white,
                                                          hintText: "Password",
                                                          ),

                                                  ),
                                              SizedBox(height: 10.0),
                                              TextField(
                      // controller: _firstName,
                                                    onChanged: (String phone){
                                                      _phoneNum= phone;
                                                    },
                                                    keyboardType: TextInputType.phone,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      hintText: "Phone",
                                                      ),

                                              ),
                                              SizedBox(height: 10.0),
                                              TextField(
                      // controller: _firstName,
                                                    onChanged: (String address){
                                                      _address= address;
                                                    },
                                                    keyboardType: TextInputType.text,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      hintText: "Address",
                                                      ),

                                              ),
                                              SizedBox(height: 10.0),
                                              TextField(
                      // controller: _firstName,
                                                  onChanged: (String cnic){
                                                    _cnic= cnic;
                                                  },
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    hintText: "CNIC",
                                                    ),

                                            ),
                                              SizedBox(height: 50.0),
                          
                                          GestureDetector(
                                                      onTap: (){
                                                      
                                                          validateAndSubmit();
            // Navigator.push(context, MaterialPageRoute(builder: (context) => MainWidget()));
                                                        // validateAndSubmit();
                                                      },
                                                      child:  Container(
                                                  height: 40.0,
                                                  child: Material(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    shadowColor: Colors.greenAccent,
                                                    color: Colors.blueGrey,
                                                    elevation: 7.0,
                                                 
                                                      child: Center(
                                                        child: Text(
                                                          'SIGNUP',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontFamily: 'Montserrat'),
                                                        ),
                                                      ),
                                                  
                                                  )),
                                                      )
                                             
                                              
                                            ],
                                          )
                                          ),
                                      // SizedBox(height: 15.0),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: <Widget>[
                                      //     Text(
                                      //       'New to Spotify?',
                                      //       style: TextStyle(
                                      //         fontFamily: 'Montserrat',
                                      //       ),
                                      //     ),
                                      //     SizedBox(width: 5.0),
                                      //     InkWell(
                                      //       child: Text('Register',
                                      //           style: TextStyle(
                                      //               color: Colors.green,
                                      //               fontFamily: 'Montserrat',
                                      //               fontWeight: FontWeight.bold,
                                      //               decoration: TextDecoration.underline)),
                                      //     )
                                      //   ],
                                      // )
                                  ]
                                  ),
                                      ],
                          
                                                
                                    ) 
                                    ,)
                                  
                                  );
                            }
                            bool tap = false;
                            Future<void> picker()async{
                            tap = true;
                            image = await ImagePicker.pickImage(source: ImageSource.gallery);
                  
                            
                            }
    
     
}