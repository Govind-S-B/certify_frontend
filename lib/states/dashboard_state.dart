import 'package:flutter/material.dart';

class LeftPaneState extends ChangeNotifier {
  int _currentLeftPaneIndex = 0;

  int get currentPageIndex => _currentLeftPaneIndex;

  void setCurrentPageIndex(int index) {
    _currentLeftPaneIndex = index;
    notifyListeners();
  }
}

class RightPaneState extends ChangeNotifier {
  int _currentRightPaneIndex = 0;

  int get currentPageIndex => _currentRightPaneIndex;

  void setCurrentPageIndex(int index) {
    _currentRightPaneIndex = index;
    notifyListeners();
  }
}
