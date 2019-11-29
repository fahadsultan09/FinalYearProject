import 'dart:convert';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'QR_Generator.dart';

// import 'package:qr_utils/qr_utils.dart';



class homePageApplication extends StatefulWidget {
  @override
  _homePageApplicationState createState() => _homePageApplicationState();
}

class _homePageApplicationState extends State<homePageApplication> {
  DateTime _date = DateTime.now();
  String finalString="";
  String selected;
  String uid;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<String> medicineID = [];
  List<String> _items = [];
  TextEditingController productNameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController expiryDateController = new TextEditingController();
  TextEditingController noOfProductController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  List<DocumentSnapshot> documents;
  Firestore _firestore  = Firestore.instance;
  @override
  void initState() { 
  //  expiryDateController.text ="2012-04-19";
    super.initState();
    auth.currentUser().then((user){
     uid =  user.uid.toString();
     getBatches();
    //  collectionReference = _firestore.collection("Batch").document(uid).collection("BatchInfo");
    });
  }

  Future<void> getBatches() async{
   final QuerySnapshot result = await Firestore.instance.collection("Batch").document(uid).collection("BatchInfo").getDocuments();
  documents = result.documents.toList();
  documents.forEach((data) => _items.add(data.documentID.toString()));
  }


  Future<Null> _selectedDate(BuildContext context)async{
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),

    );

    if(picked !=null && picked!= _date){
      setState(() {
         _date = picked; 
         expiryDateController.text = _date.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Stack(
        fit: StackFit.expand,
      children: <Widget>[

        // new Image(
        //   image: new AssetImage("assets/bg.jpg"),
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

             
              SizedBox(height: 20),
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
                  enabled: false,
                    suffixIcon: IconButton(icon: Icon(Icons.calendar_today), onPressed: () {
                        _selectedDate(context);
                    },),

                    hintText: '2012-12-12',
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
                controller: priceController,
                decoration: new InputDecoration(
                    hintText: '0',
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelStyle: new TextStyle(
                        color: Colors.black, fontSize: 15.0)
                ),
                keyboardType: TextInputType.number,
              ),
              
                SizedBox(height: 20),
              Container(
                width: 150.0,
                height: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.blueGrey)
                ),
                child : DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: new DropdownButton<String>(
                      value: selected,
                      items: _items.map((lable) {
                        return new DropdownMenuItem<String>(
                          value: lable,
                          child: new Text(lable),
                        );
                      }).toList(),
                      hint: Text('Select Badge Number'),
                      onChanged: (value) {
                        setState(() => selected = value);
                        
                      },
                    ),
                  ),
              ),
              ),

              SizedBox(height: 20),

              FlatButton(

                  color : Colors.blueGrey[500],
                  child : Column(
                      children: <Widget>[
                        //Icon(Icons.scan),
                        Text("Generate Code" , style : TextStyle(
                            color: Colors.black,
                            fontSize : 20.0
                        ))

                      ]
                  ),
                  onPressed: ()async {
             
                  for(int i = 0;i<int.parse(noOfProductController.text);i++){
                    // finalString = "";
                    var bytesData = utf8.encode(DateTime.now().toString());  
                    var hashString = sha256.convert(bytesData);
                    _firestore.collection("Batch").document(uid).collection("BatchInfo").document(selected.toString()).collection("BatchDisp").document(hashString.toString()).setData(
                        {
                          "name":productNameController.text,
                          "magDate":DateTime.now(),
                          "expDate":expiryDateController.text,
                          "prize":priceController.text,
                          "weight":weightController.text,
                          "ownerId":uid.toString(),
                          "tag":1
                      });
        

                //         QrImage(
                //   data: hashString,
                //   backgroundColor: Colors.white,
                //   size: 100.0,
                // );


                  medicineID.add(uid+"__"+selected+"__"+hashString.toString());
                  }
                     
 Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new codeGenerator(medicineID)));
                  }

                    
  // for(int i=0 ; i<ProductArray.length ; i++){
  //   // print(ProductArray[i].ProductName + ProductArray[i].BadgeNumber + ProductArray[i].expiryDate.toString() + " " + ProductArray[i].weight.toString() + " " + ProductArray[i].price.toString());
    
  //  collectionReference.document(ProductArray[i].badgeNumber).collection("BatchDisp").document().setData(
  //     {
  //       "name":ProductArray[i].productName,
  //       "magDate":DateTime.now(),
  //       "expDate":ProductArray[i].expiryDate,
  //       "prize":ProductArray[i].price,
  //       "weight":ProductArray[i].weight
  //   });
  //   print("SUCCESS");

  // }
                    // finalString = finalString + productNameController.text + " , " + expiryDateController.text + " , " + weightController.text + " , " + priceController.text +" , " + selected;
                    // print(finalString);
                    

                  
              ),
              SizedBox(height: 10),

            ],
          ),
        ),
      ]),
    );

  }
  // void _generateQR(String content) async {
  //   if (content.trim().length == 0) {

  //     setState(() {
  //       _qrImg = null;
  //     });
  //     return;
  //   }
  //   Image image;

  //   try {
  //     image = await QrUtils.generateQR(content);
  //   } catch (e){
  //     image = null;
  //     print(e.toString());
  //   }
  //   setState(() {
  //     _qrImg = image;
  //   });
  // }
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
