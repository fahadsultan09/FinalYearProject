import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:manufacturer/screens/ProfilePage.dart';
import 'package:manufacturer/screens/transactions.dart';
import 'package:manufacturer/screens/wallets.dart';
import 'package:manufacturer/sharedPreferences.dart';




class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}




class _MainPageState extends State<MainPage> {


  FirebaseAuth auth = FirebaseAuth.instance;
  String uid;


  @override
  void initState() { 
    super.initState();
   
    auth.currentUser().then((value){
      setState(() {
        uid =  value.uid.toString();
        print(uid);
      });
      
    });

  getManName();
  
    if(getName()==null){  }
    else{ getName().then(updateName); }
    
      }
      String _manfacturerName = "Fahad Sultan";
      String _manfacturerEmail = "";
      String result = "Hey Fahad";
      @override
      Widget build(BuildContext context) {
        return 
        Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            title: Text("Home Page",),
            centerTitle: true,
          ),
           drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountEmail: new Text("RDJ@gmail.com",style: TextStyle(color: Colors.black)),
                  accountName: new Text("Robert Downey Jr",style: TextStyle(color: Colors.black,fontSize: 20.0)),       
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
                  title: new Text("Page One"),
                  trailing: new Icon(Icons.arrow_upward),
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
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
                  title: new Text("Cancel"),
                  trailing: new Icon(Icons.cancel),
                  onTap: () => Navigator.pop(context),
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
                subtitle: Text("novartis_pharmaceuticals"+"@gmail.com"),
              ),
    
              SizedBox(height: 20),
    
              
              Align(
                alignment: Alignment.center,
           
                child: DefaultTabController(
                   
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TabBar(
                        
                        isScrollable: false,
                        labelColor: Theme.of(context).accentColor,
                        unselectedLabelColor: Theme.of(context)
                            .textTheme.caption.color,
                        tabs: <Widget>[
                          Tab(
                            icon: Icon(Icons.local_hospital),
                            text: "Medicines",
                          ),
                          Tab(
                            icon: Icon(Icons.sync),
                            text: "Transactions",
                          ),
                          // Tab(
                          //   text: "Buy/Sell",
                          // ),
                        ],
                      ),
    
                    
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: MediaQuery.of(context).size.height*2,
                        child: TabBarView(
                          children: <Widget>[
                            Medicines(),
                            Transactions(),
                            // BuyandSell(),
                          ],
                        ),
                      ),
    
                    ],
                  ),
                ),
              ),
    
    
            ],
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
    void getManName() async{
   Firestore.instance.collection('Manufacturer').document(uid).get().then((DocumentSnapshot){
     setState(() {
      _manfacturerName =  DocumentSnapshot.data['Full Name'].toString();
      _manfacturerEmail = DocumentSnapshot.data['Email'].toString();

     });
   }
      
);
  }
}
