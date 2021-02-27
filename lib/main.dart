import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(40),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
            ),
            Row(
              children: [
                customOutLineButton("9"),
                customOutLineButton("8"),
                customOutLineButton("7"),
                customOutLineButton("+"),
              ],
            ),
            Row(
              children: [
                customOutLineButton("6"),
                customOutLineButton("5"),
                customOutLineButton("4"),
                customOutLineButton("-"),
              ],
            ),
            Row(
              children: [
                customOutLineButton("3"),
                customOutLineButton("2"),
                customOutLineButton("1"),
                customOutLineButton("/"),
              ],
            ),
            Row(
              children: [
                customOutLineButton("C"),
                customOutLineButton("0"),
                customOutLineButton("x"),
                customOutLineButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutLineButton(String val) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(30),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }

  int first, second;
  String res, text = '';
  String opp;
  void btnClicked(String btnText) {
    if (btnText == 'C') {
      res = '';
      text = '';
      first = 0;
      second = 0;
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/') {
      first = int.parse(text);
      res = '';
      opp = btnText;
    } else if (btnText == '=') {
      second = int.parse(text);
      if (opp == '+') {
        res = (first + second).toString();
      }
      if (opp == '-') {
        res = (first - second).toString();
      }
      if (opp == 'x') {
        res = (first * second).toString();
      }
      if (opp == '/') {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }

    setState(() {
      text = res;
    });
  }
}
