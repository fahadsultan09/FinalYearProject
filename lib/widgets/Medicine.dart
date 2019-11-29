// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;


// class MedicineClass extends StatefulWidget {
//   final String name;
//   final String icon;
//   final String rate;
//   final charts.Color color;
//   MedicineClass({
//     Key key,
//     this.name, this.icon, this.rate, this.color
//   }) : super(key: key);


//   @override
//   _MedicineClassState createState() => _MedicineClassState();
// }

// class _MedicineClassState extends State<MedicineClass> {

  

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(10),
//         ),
//       ),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[

//                 Row(
//                   children: <Widget>[
//                     Image.asset(
//                       "assets/medicine.png",
//                       height: 30,
//                       width: 30,
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       "${widget.name}",
//                       style: TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),


//                 Text(
//                   "${widget.rate}",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Padding(
//             padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[

//                 Text(" "),

//                 Text(
//                   r"200 mg",
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.green[400],
//                   ),
//                 ),
//               ],
//             ),
//           ),


//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 150,
//             child: charts.LineChart(
//               <charts.Series<LinearToken, int>>[
//                 charts.Series<LinearToken, int>(
//                   id: '${widget.name}',
//                   colorFn: (_, __) => widget.color,
//                   domainFn: (LinearToken sales, _) => sales.day,
//                   measureFn: (LinearToken sales, _) => sales.value,
//                   data: data,
//                 )
//               ],
//               defaultRenderer: charts.LineRendererConfig(
//                 includeArea: true,
//                 stacked: true,
//               ),
//               animate: false,
//               primaryMeasureAxis: charts.NumericAxisSpec(
//                 renderSpec: charts.NoneRenderSpec(),
//               ),
//               domainAxis: charts.NumericAxisSpec(
// //                showAxisLine: true,
//                 renderSpec: charts.NoneRenderSpec(),
//               ),
//             ),
//           ),


//         ],
//       ),
//     );
//   }
// }
// class LinearToken {
//   final int day;
//   final int value;

//   LinearToken(this.day, this.value);
// }