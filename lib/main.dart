import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    myf() {
      print("**************IN myf******************************");

      var diceList = [1, 2, 3, 4, 5, 6];
      final _random = new Random();
      setState(() {
        leftDiceNumber = diceList[_random.nextInt(diceList.length)];
        rightDiceNumber = diceList[_random.nextInt(diceList.length)];
        total = leftDiceNumber + rightDiceNumber;
      });

      print(leftDiceNumber);
      print(rightDiceNumber);
      print(total);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    myf();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      myf();
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png')),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$total",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 150.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
