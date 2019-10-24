
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'kf_drawer.dart';
import 'screens/ProfilePage.dart';
import 'screens/dig/Transactions.dart';
import 'screens/main_page.dart';
import 'utils/class_builder.dart';
class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    ClassBuilder.registerClasses();
    super.initState();
    
        _drawerController = KFDrawerController(
          initialPage: ClassBuilder.fromString('MainPage'),
          items: [
            KFDrawerItem.initWithPage(
              text: Text('MAIN', style: TextStyle(color: Colors.white,fontSize: 20.0)),
              icon: Icon(Icons.home, color: Colors.white,size: 20.0),
              page: MainPage(),
            ),
            KFDrawerItem.initWithPage(
              text: Text(
                'Transaction',
                style: TextStyle(color: Colors.white,fontSize: 20.0),
              ),
              icon: Icon(Icons.event, color: Colors.white,size: 20.0),
              page: TransactionPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Profile',
            style: TextStyle(color: Colors.white,fontSize: 20.0),
          ),
          icon: Icon(Icons.people, color: Colors.white,size: 20.0,),
          page: ProfilePage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'SETTINGS',
            style: TextStyle(color: Colors.white,fontSize: 20.0),
          ),
          icon: Icon(Icons.settings, color: Colors.white,size: 20.0,),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          top: true,  
          child: Scaffold(
        
        body: Container(
          
          decoration: BoxDecoration(
            color: Colors.black54,
            
              image: DecorationImage(
                
                image: AssetImage('assets/medicine-background.jpg'),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [Color.fromRGBO(255, 255, 255, 1.0), Color.fromRGBO(44, 72, 171, 1.0)],
              //   // colors: [Colors.black12],
              //   tileMode: TileMode.repeated,
              // ),
            
            ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: KFDrawer(
            
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
            controller: _drawerController,
            header: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  
                padding: EdgeInsets.symmetric(horizontal: 16.0),
               
                child: Row(children: <Widget>[
                //   CircleAvatar(
                //   radius: 40.0,
                //   backgroundImage: AssetImage('assets/fahad.jpg'),
                // ),
                Padding(padding: EdgeInsets.fromLTRB(10.0,0, 0, 0)),
              //   Column(
              //     children: <Widget>[
              //       Text(
              //   'FAHAD SULTAN',
              //   style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: <Widget>[
              //     new Text("4.6"),
              //     new Icon(Icons.star)
              //   ],
              // )
              //     ],
              //   )
                ],)
              ),
            ),
            footer: KFDrawerItem(
              text: Text(
                'SIGN OUT',
                style: TextStyle(color: Colors.white,fontSize: 20.0),
              ),
              icon: Icon(
                Icons.input,
                color: Colors.white,size: 20.0
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();
                
              },
            ),
            // decoration: BoxDecoration(
            //   image: DecorationImage(image: AssetImage('assets/medicine-background.jpg'),),
            //   gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [Color.fromRGBO(255, 255, 255, 1.0), Color.fromRGBO(44, 72, 171, 1.0)],
            //     tileMode: TileMode.repeated,
            //   ),
            
            // ),
          ),
        ),
      ),
    );
  }
}
