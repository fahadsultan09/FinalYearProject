import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;


Random random = Random();
List names = [
  "Ling Waldner",
  "Gricelda Barrera",
  "Lenard Milton",
  "Bryant Marley",
  "Rosalva Sadberry",
  "Guadalupe Ratledge",
  "Brandy Gazda",
  "Kurt Toms",
  "Rosario Gathright",
  "Kim Delph",
  "Stacy Christensen",
];

List types = ["recieved", "sent"];

List coins = [
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol",
    "alt": "BTC",
    "rate": r"Rs.60",
    "color": charts.MaterialPalette.deepOrange.shadeDefault,
  },
  {
    "icon": "assets/medicine Logo.png",
    "name": "Aspirin",
    "alt": "ETH",
    "rate": r"Rs.200",
    "color": charts.MaterialPalette.blue.shadeDefault,
  },
  {
    "icon": "assets/medicine Logo.png",
    "name": "Paracetamol",
    "alt": "XRP",
    "rate": r"Rs.501",
    "color": charts.MaterialPalette.indigo.shadeDefault,
  },
  {
    "icon": "assets/medicine Logo.png",
    "name": "Nevanac drops",
    "alt": "LTC",
    "rate": r"Rs.620",
    "color": charts.MaterialPalette.gray.shadeDefault,
  },
  {
    "icon": "assets/xmr.png",
    "name": "Monero",
    "alt": "XMR",
    "rate": r"Rs82.57",
    "color": charts.MaterialPalette.red.shadeDefault,
  },
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.143.41",
    "color": charts.MaterialPalette.deepOrange.shadeDefault,
  },
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.deepOrange.shadeDefault,
  },
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.139.41",
    "color": charts.MaterialPalette.green.shadeDefault,
  },
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.gray.shadeDefault,
  },
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  },
  
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  },
   {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, 
  {
    "icon": "assets/medicine Logo.png",
    "name": "Brofuen ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, {
    "icon": "assets/medicine Logo.png",
    "name": "Neurontin",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, {
    "icon": "assets/medicine Logo.png",
    "name": "Dollar DS ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, {
    "icon": "assets/medicine Logo.png",
    "name": "Cafcoal",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, {
    "icon": "assets/medicine Logo.png",
    "name": "Aveil",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, {
    "icon": "assets/medicine Logo.png",
    "name": "Dispirin ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  },
   {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, 
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  },
   {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, 
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, 
  {
    "icon": "assets/medicine Logo.png",
    "name": "Pandadol 124 ",
    "alt": "BTC",
    "rate": r"Rs.133.41",
    "color": charts.MaterialPalette.blue.shadeDefault,
  }, 
];

List transactions = List.generate(500, (index)=>{
  "name": names[random.nextInt(10)],
  "date": "${random.nextInt(31).toString().padLeft(2,"0")}"
      "/${random.nextInt(12).toString().padLeft(2,"0")}/2019",
  "amount": "\Rs.${random.nextInt(1000).toString()}",
  "type": types[random.nextInt(2)],
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
});

