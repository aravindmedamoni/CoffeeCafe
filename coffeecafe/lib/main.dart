

import 'package:coffeecafe/screens/orders_details_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Csfe',
      debugShowCheckedModeBanner: false,
      home: OrdersDetailsPage(),
    );
  }
}


