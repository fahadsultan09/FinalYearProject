import 'dart:math';
import 'package:flutter/material.dart';
import 'package:manufacturer/screens/transactions.dart';
import 'package:manufacturer/screens/wallets.dart';
import 'package:manufacturer/utils/data.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static Random random = Random();
  String name = "Novartis Pharmaceuticals Pakistan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
      ),


      body: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png",),
              radius: 25,
            ),
            title: Text(name),
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
                        text: "Medicines",
                      ),
                      Tab(
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
             
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
