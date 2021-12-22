import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/CalculatorButton.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key key}) : super(key: key);

  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  String history = '';
  String expression = '0';
  int fontcolor = 0xFFFFFFFF;
  double fontsize = 55;

  void numClick(String text) {
    setState(() {
      List<String> operators = ["+", "-", "*", "/", "%"];
      if (expression == '0' || fontcolor == 0xFFE91E63) {
        expression = '';
        history = "";
        expression += text;
        fontcolor = 0xFFFFFFFF;
        fontsize = 55;
      } else if (fontcolor == 0xFF1E88E5) {
        if (operators.contains(text)) {
          expression += text;
          fontcolor = 0xFFFFFFFF;
          fontsize = 55;
          history = "";
        } else {
          expression = '';
          history = "";
          expression += text;
          fontcolor = 0xFFFFFFFF;
          fontsize = 55;
        }
      } else {
        history = "";
        expression += text;
        fontcolor = 0xFFFFFFFF;
        fontsize = 55;
      }
    });
  }

  void delClick(String text) {
    setState(() {
      if (fontcolor == 0xFF1E88E5 || fontcolor == 0xFFE91E63) {
        expression = history;
        history = "";
      }
      expression = expression.substring(0, expression.length - 1);
      fontcolor = 0xFFFFFFFF;
      fontsize = 55;
      if (expression == "") {
        expression = "0";
      }
      //expression = "0";
    });
  }

  void allClear(String text) {
    setState(() {
      expression = '0';
      history = "";
      fontcolor = 0xFFFFFFFF;
      fontsize = 55;
    });
  }

  void evaluate(String text) {
    setState(() {
      history = expression;
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      print(eval);
      if (eval.isFinite) {
        try {
          expression = eval.toString().substring(0, 9);
        } catch (e) {
          expression = eval.toString();
        }
        fontcolor = 0xFF1E88E5;
        fontsize = 65;
      } else {
        expression = "BAD EXPRESSION";
        fontcolor = 0xFFE91E63;
        fontsize = 50;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Calculator',
              style: TextStyle(fontSize: 24),
            ),
          ),
          backgroundColor: Color(0xFF005CB2),
        ),
        backgroundColor: Color(0xFF171717),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color(0xFF000000),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                right: 12,
                top: 5,
              ),
              decoration: BoxDecoration(color: Color(0xFF000000)),
              child: Text(
                history,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: 32),
                    color: Color(0xFFAEAEAE)),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xFF000000)),
              child: Text(
                expression,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: fontsize),
                    color: Color(fontcolor)),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: 'AC',
                  fillColor: 0xFF000000,
                  textColor: 0xFF1E88E5,
                  callback: allClear,
                ),
                CalculatorButton(
                  text: '+-',
                  fillColor: 0xFF000000,
                  textColor: 0xFF1E88E5,
                ),
                CalculatorButton(
                  text: '%',
                  fillColor: 0xFF000000,
                  textColor: 0xFF1E88E5,
                  textSize: 32,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '/',
                  fillColor: 0xFF000000,
                  textColor: 0xFF1E88E5,
                  textSize: 32,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '7',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '8',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '9',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '*',
                  fillColor: 0xFF000000,
                  textColor: 0xFF1E88E5,
                  textSize: 32,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '4',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '5',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '6',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '-',
                  fillColor: 0xFF000000,
                  textColor: 0xFF1E88E5,
                  textSize: 32,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '1',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '2',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '3',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '+',
                  fillColor: 0xFF000000,
                  textColor: 0xFF1E88E5,
                  textSize: 32,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  text: '0',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '.',
                  callback: numClick,
                ),
                CalculatorButton(
                  text: 'del',
                  fillColor: 0xFF000000,
                  textColor: 0xFFAEAEAE,
                  textSize: 23,
                  callback: delClick,
                ),
                CalculatorButton(
                  text: '=',
                  fillColor: 0xFF005CB2,
                  textSize: 34,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
