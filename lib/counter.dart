import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  int _counter = 0;
  int get getCounter {
    return _counter;
  }

  incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
