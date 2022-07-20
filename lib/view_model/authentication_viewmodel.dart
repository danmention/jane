import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:jane/model/request/signup_request.dart';

import '../model/request/login_request.dart';
import '../model/services/local_auth/local_auth_api.dart';
import '../utils/utils.dart';

class AuthenticationViewModel extends ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;
  final auth = FirebaseAuth.instance;


  Timer? timer;
  String? email;

  String useremail(){
 return  auth.currentUser!.email! ;
  }

  setloading(bool value){
    _loading = value;
    notifyListeners();
  }

Future<void> signup(SignupRequest signupRequest , BuildContext context)async{
  setloading(true);
  try {
    auth.
    createUserWithEmailAndPassword(
        email: signupRequest.email!, password: signupRequest.password!).
    then((value) {
      setloading(false);
      Utils.showSnackBar("Verification link sent ", context);

      Navigator.pushReplacementNamed(context, 'verify');

    }


    ).onError((error,
        stackTrace) {
      setloading(false);
      Utils.showSnackBar(error.toString(), context);
    });
  }  on FirebaseAuthException catch(e){
    Utils.showSnackBar(e.message.toString(), context);
  }


  notifyListeners();
}


  Future<void> logout( BuildContext context)async{
    setloading(true);
    try {
      auth.signOut().
      then((value) => Navigator.pushNamed(context, 'login')).onError((error,
          stackTrace) {
        setloading(false);
        Utils.showSnackBar(error.toString(), context);
      });
    } on FirebaseAuthException catch(e){
      setloading(false);
      Utils.showSnackBar(e.message.toString(), context);
    }


    notifyListeners();
  }




  Future<void> login(LoginRequest loginRequest , BuildContext context)async{
    setloading(true);
    try {
      auth.
      signInWithEmailAndPassword(
          email: loginRequest.email!, password: loginRequest.password!).
      then((value) => Navigator.pushNamed(context, 'home'))
          .onError((error,
          stackTrace) {
        setloading(false);
        Utils.showSnackBar(error.toString(), context);
      });
    } on FirebaseAuthException catch(e){
      setloading(false);
      Utils.showSnackBar(e.message.toString(), context);
    }


    notifyListeners();
  }






  Future<void> loginWithBiometric( BuildContext context)async{
    setloading(true);
    try {
      final isAuthenticatedUser = await LocalAuthApi.authenticate();
      setloading(false);
      print(' finger print $isAuthenticatedUser');
      if(isAuthenticatedUser){
        Navigator.pushNamed(context, 'home');
      }else{
        Utils.showSnackBar("Fingerprint authentication failed", context);
      }



    }  catch(e){
      Utils.showSnackBar(e.toString(), context);
    }


    notifyListeners();
  }



}