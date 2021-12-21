import 'package:flutter/widgets.dart';

class CounterNotifier with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}
