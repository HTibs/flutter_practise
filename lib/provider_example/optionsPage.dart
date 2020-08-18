import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'colorChange.dart';

class optionsPage extends StatefulWidget {
  @override
  _optionsPageState createState() => _optionsPageState();
}

class _optionsPageState extends State<optionsPage> {
  @override
  Widget build(BuildContext context) {
    var colorSquare = Provider.of<colorChange>(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  colorSquare.squareColor = Colors.green;
                },
                child: Container(
                  height: 100.0,
                  width: 50.0,
                  color: Colors.green,
                  child: Center(
                    child: Text('Green'),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  colorSquare.squareColor = Colors.red;
                },
                child: Container(
                  height: 100.0,
                  width: 50.0,
                  color: Colors.red,
                  child: Center(
                    child: Text('Red'),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  colorSquare.squareColor = Colors.blue;
                },
                child: Container(
                  height: 100.0,
                  width: 50.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text('Blue'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
