import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import '../../kf_drawer.dart';
class TransactionPage extends KFDrawerContent {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // String _name = "Fahad Sultan";
  @override
  Widget build(BuildContext context) {
    // final _width = MediaQuery.of(context).size.width;
    // final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
              body: Center(
          child: Column(
            children: <Widget>[
              Row(
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
                  new Text("Transaction",style: TextStyle(fontSize: 20.0),)
                ],
              ),
              Expanded(
                child: new Container(
                  child: Center(child: new Text("Transactions")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
      }
   
}
