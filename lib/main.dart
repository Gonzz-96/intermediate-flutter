import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/pages/pinterest_page.dart';
import 'package:intermediate_flutter/src/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PinterestPage(),
    );
  }
}
