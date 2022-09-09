import 'package:flutter/material.dart';

class AppSettings with ChangeNotifier {
  bool _isRiderMode = false;
  int _pageNo = 0;

  int get pageNo {
    return _pageNo;
  }

  bool get isRiderMode {
    return _isRiderMode;
  }

  void switchRiderMode() {
    _isRiderMode = !isRiderMode;
    notifyListeners();
  }

  void setPageNo(pageNo) {
    _pageNo = pageNo;
    notifyListeners();
  }
}
