import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loading = status;
      notifyListeners();
    });
  }
}
