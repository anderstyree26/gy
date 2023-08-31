import 'package:flutter/cupertino.dart';

class NavigationModel extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void updateCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
