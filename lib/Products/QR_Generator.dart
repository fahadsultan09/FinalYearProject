

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class codeGenerator extends StatefulWidget {
  List<String> medicine;
  codeGenerator(this.medicine);
  @override
  _codeGeneratorState createState() => _codeGeneratorState(this.medicine);
}

class _codeGeneratorState extends State<codeGenerator> {
List<String> medicines;

_codeGeneratorState(this.medicines);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("QR Generator"),
          //centerTitle: true,
        ),

        body : Center(
          child: ListView(
            children: <Widget>[
              // for(var i=0 ; i<numberOfProduct ; i++)
              //   new Text(QRGenerationCodeList[i].toString()),

              for(var i=0 ; i<medicines.length ; i++)
             QrImage(
                  data: medicines[i],
                  backgroundColor: Colors.white,
                  size: 200.0,
                  ),
            ],
          ),
        )
    );
  }
}
