import 'package:flutter/cupertino.dart';

class AuthenticationViewModel extends ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value){
    _loading = value;
    notifyListeners();
  }





}