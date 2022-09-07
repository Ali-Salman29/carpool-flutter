import 'package:flutter/material.dart';

class AppSettings with ChangeNotifier {
  bool isRiderMode = false;

  void switchRiderMode() {
    isRiderMode = !isRiderMode;
    notifyListeners();
  }
}
