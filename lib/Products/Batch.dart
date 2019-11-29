import 'package:flutter/material.dart';
import 'package:manufacturer/Products/Medicines.dart';
import 'package:manufacturer/Products/transactions.dart';

class batchClass extends StatefulWidget {
  @override
  _batchClassState createState() => _batchClassState();
}

class _batchClassState extends State<batchClass> with SingleTickerProviderStateMixin{
   TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

 
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
            appBar: new AppBar(
              centerTitle: true,
              title: new Text("Batches"),
              bottom: new TabBar(
                tabs: <Tab>[
                  new Tab(
                    text: "Medicines",
                    icon: new Icon(Icons.local_hospital),
                  ),
                  new Tab(
                    text: "Transactions",
                    icon: new Icon(Icons.transform),
                  ),
                ],
                controller: _tabController,
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
                new Medicines(),
                new Transactions(),
              ],
              controller: _tabController,
            ),
     
        );
  }
}