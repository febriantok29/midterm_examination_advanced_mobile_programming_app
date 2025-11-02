import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }
}
