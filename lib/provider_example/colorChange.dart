import 'package:flutter/material.dart';

class colorChange with ChangeNotifier {
  static Color _squareColor = Colors.green;

  set squareColor(newColor) {
    _squareColor = newColor;
    notifyListeners();
  }

  Color get squareColor => _squareColor;
}
