import 'dart:async';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:manufacturer/Login/Login_X.dart';
import 'package:manufacturer/screens/Products/Products.dart';
import 'package:manufacturer/screens/ProfilePage.dart';

import 'Products/Batch.dart';




class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}




class _MainPageState extends State<MainPage> {


  FirebaseAuth auth = FirebaseAuth.instance;
  String uid;

  void getDetails(){
     Firestore.instance.collection('Manufacturer').document(uid).get().then((DocumentSnapshot documentSnapshot) async {
     setState(() {

      _manfacturerName =  documentSnapshot.data["FullName"].toString();
      _manfacturerEmail = documentSnapshot.data['Email'].toString();
     });
   }
      
);
  }
  @override
  void initState() { 
    super.initState();
   
    auth.currentUser().then((value){
      setState(() {
        uid =  value.uid.toString();
        print(uid);
        getDetails();
      });
      
    });

    // print("The name of the man is" +getManName().toString());
  
    // if(getName()==null){ 

    //  }
    // else{ getName().then(updateName); }
    
      }
      String _manfacturerName = "Loading..", _manfacturerEmail = "Loading..";
      
      String result = "Hey Fahad";
      @override
      Widget build(BuildContext context) {
        return 
        SafeArea(
          top: true,
                  child: Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.white,
              title: Text("Home Page",),
              centerTitle: true,
            ),
             drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountEmail: new Text(_manfacturerEmail,style: TextStyle(color: Colors.black)),
                    accountName: new Text(_manfacturerName,style: TextStyle(color: Colors.black,fontSize: 20.0)),       
                    currentAccountPicture:  new CircleAvatar(
                         backgroundImage: AssetImage('assets/logo.png'),
                      ),
                  
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/medicine-background.jpg"),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  new ListTile(
                    title: new Text("Product"),
                    trailing: new Icon(Icons.arrow_upward),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductScreen()));
                    }
                  ),
                  new ListTile(
                    title: new Text("Batches"),
                    trailing: new Icon(Icons.arrow_upward),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new batchClass()));
                    }
                  ),
                  new ListTile(
                    title: new Text("Profile"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProfilePage()));
                    }
                  ),
                  new Divider(),
                  new ListTile(
                    subtitle: Text("Sign Out From the Application"),
                    title: new Text("Sign Out"),
                    trailing: new Icon(Icons.exit_to_app),
                    onTap: (){
                      auth.signOut();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new LoginX()));
                    }
                  ),
                ],
              ),
            ),
            body: new Container(
              child: ListView(
              // padding: EdgeInsets.symmetric(horizontal: 10),
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/logo.png",),
                    radius: 25,
                  ),
                  title: Text(_manfacturerName),
                  subtitle: Text(_manfacturerEmail),
                ),
    
                SizedBox(height: 20),
    
                
      
    
    
              ],
            ),
            ),
          ),
        );
                
              
      }
      Future _scanQR()async
              {
                try{
                  String qrResult = await BarcodeScanner.scan();
                  setState(() {
                    result = qrResult;
                  });
                }on PlatformException catch(ex){
                  if(ex.code == BarcodeScanner.CameraAccessDenied)
                  {
                    setState(() {
                      result = "Camera Permission Denied";
                    });
                  }
                  else{
                    setState(() {
                    result = "Unknown Error $ex";  
                    });
                    
                  }
                }on FormatException{
                  setState(() {
                    result = "You pressed Back button before Scanning";
                  });
                }catch(ex){
                    setState(() {
                    result = "Unknown Error $ex";  
                    });
                }
                
              }
              
    
      Future<void> updateName(String value) async {

        setState(() {
         this._manfacturerName = value; 
        });
  }
//     Future<String> getManName() async{
  

// Firestore.instance.collection('Manufacturer').document(uid).get().then((document) {
 
//    print(uid);
//    return document.data["FullName"].toString();
// });

//   }
}
