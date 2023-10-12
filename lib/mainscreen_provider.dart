import 'package:flutter/material.dart';

class IdNotifier extends ChangeNotifier {
  int _id = 0;

  int get getId => _id;

  set setId(int newIndex) {
    _id = newIndex;
    notifyListeners();
  }
}
