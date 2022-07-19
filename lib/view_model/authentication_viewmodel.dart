import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:jane/model/request/signup_request.dart';

import '../model/request/login_request.dart';
import '../utils/utils.dart';

class AuthenticationViewModel extends ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value){
    _loading = value;
    notifyListeners();
  }

Future<void> signup(SignupRequest signupRequest , BuildContext context)async{
  setloading(true);
  try {
    FirebaseAuth.instance.
    createUserWithEmailAndPassword(
        email: signupRequest.email!, password: signupRequest.password!).
    then((value) => Navigator.pushNamed(context, 'home')).onError((error,
        stackTrace) {
      setloading(false);
      Utils.showSnackBar(error.toString(), context);
    });
  } catch(e){
    Utils.showSnackBar(e.toString(), context);
  }


  notifyListeners();
}



  Future<void> login(LoginRequest loginRequest , BuildContext context)async{
    setloading(true);
    try {
      FirebaseAuth.instance.
      signInWithEmailAndPassword(
          email: loginRequest.email!, password: loginRequest.password!).
      then((value) => Navigator.pushNamed(context, 'home')).onError((error,
          stackTrace) {
        setloading(false);
        Utils.showSnackBar(error.toString(), context);
      });
    } catch(e){
      Utils.showSnackBar(e.toString(), context);
    }


    notifyListeners();
  }





}