import 'package:flutter/material.dart';

import 'package:shopapp/Screens/Product_Overview_Screen.dart';
import 'package:shopapp/Screens/Product_Details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: ProductOverviewScreen(),
      routes: {
        ProductDetails.routeName: (ctx) => ProductDetails()
      },
    );
  }
}


