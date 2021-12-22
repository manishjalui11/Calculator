import 'package:flutter/material.dart';
import './pages/HomePage.dart';

void main() {
  runApp(Calculator());
}

//upto 9-digit long calculator
class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: CalculatorApp(),
    );
  }
}
