import 'dart:ui';
import 'package:flutter/material.dart';

import 'QR_Generator.dart';


class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  
  // List<Product> _product = new Product();
  String finalString="";
  TextEditingController productNameController = new TextEditingController();
  TextEditingController manufacturerController = new TextEditingController();
  TextEditingController expiryDateController = new TextEditingController();
  TextEditingController noOfProductController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Stack(
        fit: StackFit.expand,
                    children: <Widget>[

                      // new Image(
                      //   image: new AssetImage("assets/medicine Logo.png"),
                      //   fit: BoxFit.cover,
                      //   colorBlendMode: BlendMode.lighten,
                      //   color: Colors.blueGrey,
                      //   filterQuality: FilterQuality.low,
                      // ),
                      Container(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100.withOpacity(0.2),
                              )
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(5.0),
                        height: 45.0,
                        child: new ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            new Image(
                              image: new AssetImage("assets/logo.png"),
                              height: 120.0,
                              width: 80.0,
                            ),

                            SizedBox(height: 5),

                            new TextFormField(

                              controller: noOfProductController,

                              decoration: new InputDecoration(
                                  labelText: "Number Of Product",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelStyle: new TextStyle(
                                      color: Colors.black, fontSize: 15.0)
                              ),
                              keyboardType: TextInputType.number,
                            ),

                            SizedBox(height: 20),
                            new TextFormField(
                              controller: productNameController,
                              decoration: new InputDecoration(
                                  labelText: "Product Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelStyle: new TextStyle(
                                      color: Colors.black, fontSize: 15.0)
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 20),
                            new TextFormField(
                              controller: expiryDateController,
                              decoration: new InputDecoration(
                                  labelText: "Expiry Date",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelStyle: new TextStyle(
                                      color: Colors.black, fontSize: 15.0)
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            SizedBox(height: 20),
                            new TextFormField(
                              controller: weightController,
                              decoration: new InputDecoration(
                                  labelText: "Weight",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelStyle: new TextStyle(
                                      color: Colors.black, fontSize: 15.0)
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20),
                            new TextFormField(
                              controller: manufacturerController,
                              decoration: new InputDecoration(
                                  labelText: "Manufacturer",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelStyle: new TextStyle(
                                      color: Colors.black, fontSize: 15.0)
                              ),
                              keyboardType: TextInputType.text,
                            ),

                            FlatButton(
                                                                                          color : Colors.blueGrey[200],
                                child : Column(
                                    children: <Widget>[
                                      //Icon(Icons.scan),
                                      Text("Generate Code" , style : TextStyle(
                                          color: Colors.black,
                                          fontSize : 20.0
                                      ))

                                    ]
                                ),
                                onPressed: () {
                                  finalString = "";
                                  // _product.name = productNameController.text;
                                  // _product.expDate = expiryDateController.text.toString();
                                  // _product.weight = weightController.text.toString();
                                  // print(_product.name);
                                  finalString = finalString + noOfProductController.text + " , " + productNameController.text + " , " + expiryDateController.text + " , " + weightController.text + " , " + manufacturerController.text;
                                  
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => codeGenerator(finalString : finalString)
                                      )
                                  );

                                }
                            ),
                            SizedBox(height: 10),

                          ],
                        ),
                      ),
                    ]),
    );

  }
}

//class secondProductScreen extends StatefulWidget {
//  @override
//  _secondProductScreenState createState() => _secondProductScreenState();
//}

//class _secondProductScreenState extends State<secondProductScreen> {
//  String finalString;
//  secondProductScreen({this.finalString});
//  List data;
//
//  @override
//  void initState(){
//    super.initState();
//    this.getJsonData();
//  }
//
//  Future<String> getJsonData()async{
//    var response =await http.get(
//      Uri.encodeFull(URL),
//      headers : {"Accept" : "application/json"}
//    );
//    print(response.body);
//    setState(() {
//      var ConvertDataToJSON = json.decode(response.body);
//      data = ConvertDataToJSON['Employees'];
//    });
//    return "Success";
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}
