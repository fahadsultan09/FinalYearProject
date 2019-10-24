// import 'package:final_year_project/screens/EditProfile.dart';
import 'package:flutter/material.dart';
// import 'package:final_year_project/kf_drawer.dart';
import 'package:flutter/cupertino.dart';

import '../kf_drawer.dart';
import 'EditProfile.dart';

class ProfilePage extends KFDrawerContent {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name =  "Novartis Pharmaceuticals Pakistan";
  @override
  Widget build(BuildContext context) {
        final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
              body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  new Text("Profile",style: TextStyle(fontSize: 20.0),),
                  new IconButton(icon: Icon(Icons.edit), onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                  },)
                ],
              ),
              Expanded(
          
                child: new Container(
                  child: new Stack(
                    children: <Widget>[
                      // new Image.asset("fahad.jpg"),
                     new Container(
                    
                         
                          ),
                      new Center(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: _height/12,),

                            new CircleAvatar(
                              
                              radius: _width<_height ?_width/6:_height/6,
                              backgroundImage: AssetImage("assets/logo.png"),
                            ),
                            new SizedBox(height: _height/25.0,),
                            Text(_name,style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/20, color: Colors.black),),
                             new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                             child: Text("Manafacturer",style: TextStyle(fontWeight: FontWeight.normal,fontSize: _width/25,color: Colors.black),textAlign: TextAlign.center,),
                             
                             ),
                          new Divider(height: _height/30,color: Colors.black,),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                            
                            rowCell(231,"Transaction"),
                            rowCell(45,"Medicine Scan")
                          ],),
                           new Divider(height: _height/30,color: Colors.black),
                           
                          new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: ()
                          {
                            
                          },
                    child: GestureDetector(
                    
                        onTap: (){
                          
                        },
                                          child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                        new Icon(Icons.edit),
                        new SizedBox(width: _width/30,),
                        new Text('Edit Profile')
                      ],)),
                    ),color: CupertinoColors.lightBackgroundGray,),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
      }
      Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.black),),
    new Text(type,style: new TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
  ],));
}
