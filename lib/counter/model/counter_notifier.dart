import 'package:flutter/widgets.dart';

class CounterNotifier with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

/// если использовать ValueNotifier то нужно указывать начальное значение в конструкторе
// class CounterNotifier extends ValueNotifier {
//   int _counter = 0;
//
//   CounterNotifier(value) : super(value);
//
//   int get counter => _counter;
//
//   void increment() {
//     _counter++;
//     notifyListeners();
//   }
// }