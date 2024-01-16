import 'dart:math';

import 'package:flutter/material.dart';

class DiceProvider extends ChangeNotifier {
  List<int> values = [];
  List<int> history = [];

  List<int> _generateRandomListOfDice(int nrOfDice) {
    return List<int>.generate(nrOfDice, (_) => Random().nextInt(6) + 1);
  }

  List<int> _iterateList() {
    return List<int>.generate(values.length, (i) => (values[i] % 6) + 1);
  }

  int _getRestrictedNumberOfDice(int nrOfDice) => min(99, nrOfDice);

  void updateHistory() {
    history.addAll(values.reversed.toList());
    history =
        history.skip(history.length <= 10 ? 0 : history.length - 10).toList();
  }

  void rollTheDice(int nrOfDice) async {
    updateHistory();
    notifyListeners();
    nrOfDice = _getRestrictedNumberOfDice(nrOfDice);
    values = _generateRandomListOfDice(nrOfDice);
    for (int time = 0; time <= 2000; time += 100) {
      await Future.delayed(const Duration(milliseconds: 100));
      values = _iterateList();
      notifyListeners();
    }
  }
}
