
import 'package:flutter/material.dart';

import 'package:manufacturer/utils/data.dart';
import 'package:manufacturer/widgets/Medicine.dart';



class Medicines extends StatefulWidget {
  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {


  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: coins.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Map coin = coins[index];

          return MedicineClass(
            name: coin['name'],
            icon: coin['icon'],
            rate: coin['rate'],
            color: coin['color'],
          );
        },
      
    );
  }
}

