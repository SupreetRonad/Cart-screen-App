import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'checkoutAddress.dart';

var item = [
  ["iPhone XR", "Yellow | 128 GB", "imgs/a1.png", 52900, 1, 52900],
  ["iPhone mini", "Purple | 256 GB", "imgs/a2.png", 84900, 1, 84900],
  ["iPad Pro (11 inch)", "Silver | 128 GB | WiFi", "imgs/a3.png", 79900, 1, 84900]
];



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home: CheckOutAddress(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(

      ),
    );
  }
}
