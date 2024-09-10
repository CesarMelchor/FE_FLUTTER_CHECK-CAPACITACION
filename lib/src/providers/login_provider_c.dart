import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _passC = true;

  bool get passC => _passC;


  void setLoginCredencial() {
    _passC = !_passC;
    notifyListeners();
  }

  
}
