
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:manufacturer/utils/data.dart';

import 'package:charts_flutter/flutter.dart' as charts;


class Medicines extends StatefulWidget {
  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
FirebaseAuth auth = FirebaseAuth.instance;
String uid = "";
static Random random = Random();
  final data = [
    LinearToken(0, 50),
    LinearToken(1, 5),
    LinearToken(2, random.nextInt(300)),
    LinearToken(3, random.nextInt(300)),
    LinearToken(4, random.nextInt(300)),
    LinearToken(5, random.nextInt(300)),
    LinearToken(6, random.nextInt(300)),
    LinearToken(7, random.nextInt(300)),
    LinearToken(8, random.nextInt(300)),
    LinearToken(9, random.nextInt(300)),
    LinearToken(10, random.nextInt(300)),
    LinearToken(11, 200),
    LinearToken(12, random.nextInt(300)),
    LinearToken(13, random.nextInt(300)),
    LinearToken(14, 52),
    LinearToken(15, random.nextInt(300)),
    LinearToken(16, random.nextInt(300)),
    LinearToken(17, random.nextInt(300)),
    LinearToken(18, random.nextInt(300)),
    LinearToken(19, random.nextInt(300)),
    LinearToken(20, random.nextInt(300)),
    LinearToken(21, random.nextInt(300)),
    LinearToken(22, random.nextInt(300)),
    LinearToken(23, random.nextInt(300)),
    LinearToken(24, random.nextInt(300)),
    LinearToken(25, random.nextInt(300)),
    LinearToken(26, random.nextInt(300)),
    LinearToken(27, random.nextInt(300)),
    LinearToken(28, random.nextInt(300)),
    LinearToken(29, random.nextInt(300)),
    LinearToken(30, random.nextInt(300)),
    LinearToken(31, random.nextInt(300)),
  ];
List<DocumentSnapshot> documents;
charts.Color color;
QuerySnapshot result;
@override
void initState() { 
  super.initState();
  // Firestore.instance.collection("Batch").document(uid).collection("BatchInfo").getDocuments();

  auth.currentUser().then((user){
     uid =  user.uid.toString();
    getBatch();
    });
}
void getBatch()async{
  result = await Firestore.instance.collection("Batch").document(uid).collection("BatchInfo").getDocuments();
  if(result!=null){
    print(result);
  }
  documents = result.documents.toList();
}
  @override
  Widget build(BuildContext context) {

  
    return documents==null? Center(child: Text("Loading..."),) :ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Map _batch = batch[index];

          return   Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/medicine.png",
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      documents[index].documentID,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),


                Text(
                  "20",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Text("asdsdadsa "),

                Text(
                  r"200 mg",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[400],
                  ),
                ),
              ],
            ),
          ),


          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: charts.LineChart(
              <charts.Series<LinearToken, int>>[
                charts.Series<LinearToken, int>(
                  id: documents[index].documentID,
                  // colorFn: ,
                  // colorFn: (_, __) => ,
                  domainFn: (LinearToken sales, _) => sales.day,
                  measureFn: (LinearToken sales, _) => sales.value,
                  data: data,
                )
              ],
              defaultRenderer: charts.LineRendererConfig(
                includeArea: true,
                stacked: true,
              ),
              animate: false,
              primaryMeasureAxis: charts.NumericAxisSpec(
                renderSpec: charts.NoneRenderSpec(),
              ),
              domainAxis: charts.NumericAxisSpec(
//                showAxisLine: true,
                renderSpec: charts.NoneRenderSpec(),
              ),
            ),
          ),


        ],
      ),
    );
        },
      
    );
  }
}
class LinearToken {
  final int day;
  final int value;

  LinearToken(this.day, this.value);
}

