import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class codeGenerator extends StatefulWidget {
  String finalString;
  codeGenerator({this.finalString});

  @override
  _codeGeneratorState createState() => _codeGeneratorState(finalString);
}

class _codeGeneratorState extends State<codeGenerator> {
  String finalString;
  _codeGeneratorState(this.finalString);
  @override
  Widget build(BuildContext context) {
  print("Using SubString : " + finalString.substring(0,finalString.indexOf(",")));
  int numberOfProduct = int.parse(finalString.substring(0,finalString.indexOf(",")));
  print("Integer Number : " + numberOfProduct.toString());
  String trimedString = finalString.substring(finalString.indexOf(",")+1);
  print("trimedString : " + trimedString.trim());
  print(new DateTime.now().millisecondsSinceEpoch);
  var QRGenerationCodeList = new List();


  for(var i=0 ; i<numberOfProduct ; i++)
    QRGenerationCodeList.add((new DateTime.now().millisecondsSinceEpoch).toString() + i.toString() + trimedString.trim());
   //print("QRGenerationFinalString : " + QRGenerationString);
  //print("Final String For QR generation : " + finalString);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("BarCode Generator"),
          //centerTitle: true,
        ),

        body : Center(
          child: ListView(
            children: <Widget>[
              for(var i=0 ; i<numberOfProduct ; i++)
                new Text(QRGenerationCodeList[i]),

              for(var i=0 ; i<QRGenerationCodeList.length ; i++)
                QrImage(
                  data: QRGenerationCodeList[i],
                  backgroundColor: Colors.white,
                  size: 100.0,
                ),
            ],
          ),
        )
    );
  }
}

