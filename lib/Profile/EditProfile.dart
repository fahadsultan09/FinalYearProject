import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

   
  Firestore _firestore = Firestore.instance;
  
    
  String _fullName;
  String _email;
  String _password;
  String _phoneNum;
  String _address;
  String _cnic;
  String uid;
Future<void> getUser() async{


}
Future<void> setUser()async{
      FirebaseUser user = await FirebaseAuth.instance.currentUser(); 


 _firestore.collection('Users').document(user.uid.toString())
.get().then((DocumentSnapshot) {
 setState(() {
   
   _fullName = DocumentSnapshot.data['Name'].toString();
  
   _email = DocumentSnapshot.data['Email'].toString();
   _address = DocumentSnapshot.data['Address'].toString();
   _phoneNum = DocumentSnapshot.data['Phone'].toString();
   _cnic = DocumentSnapshot.data['CNIC'].toString();
    
   
   
   
 });
}
);

}
  @override
  void initState() {
    setUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
        ),
        // resizeToAvoidBottomPadding: false,
        body: SafeArea(
        
        child: SingleChildScrollView(
                  child: Container(
                                            padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[

                                            TextFormField(
                                                  initialValue: "" ,
                                                  
                                                    onChanged: (String fullname){
                                                      _fullName = fullname;
                
                                                    },
                                                    keyboardType: TextInputType.text,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      hintText: "Name",
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
                                                        
                                                        
                                                        },
                                                        child:  Container(
                                                    height: 40.0,
                                                    child: Material(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      shadowColor: Colors.grey,
                                                      color: Colors.blueGrey,
                                                      elevation: 7.0,
                                                   
                                                        child: Center(
                                                          child: Text(
                                                            'UPDATE',
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
                ),
      ),
    );
    
  }
}
