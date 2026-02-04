import 'package:flutter/material.dart';
import 'package:pmi_calculator/page/bmi_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiScreen(),
    );
    
  }
}