import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:manufacturer/screens/transactions.dart';
import 'package:manufacturer/screens/wallets.dart';

import '../kf_drawer.dart';

class MainPage extends KFDrawerContent {
  MainPage({
    Key key,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  // void initState() { 
  //   super.initState();
    
  //   Future<FirebaseUser> _user =  FirebaseAuth.instance.currentUser();
    
  //   Firestore firestore = Firestore.instance;


  //   firestore.collection("Users").document()

  // }
  String _manfacturerName = "Novartis Pharmaceuticals Pakistan";
  String result = "Hey Fahad";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainA,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
                new Text("Home Page")
              ],
            ),
            Expanded(
             child: new Container(
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
}
