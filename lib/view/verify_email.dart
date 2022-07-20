import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jane/utils/constants.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  User? _user;
  final auth = FirebaseAuth.instance;
  Timer? timer;

  @override
  void initState() {
    _user = auth.currentUser;
    _user!.sendEmailVerification();

   timer  =  Timer.periodic(Duration(seconds: 5), (timer) {
     checkEmailIsVerified();
   });
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.ksidePadding),
        child: Container(child: Center(
          child: Text("An email has been to ${_user!.email} kindly verify, Check your spam if not in your inbox", textAlign: TextAlign.center,)
        ),),
      ),
    );
  }
  Future<void>checkEmailIsVerified()async{
    _user = auth.currentUser;
    await _user!.reload();
    if(_user!.emailVerified){
      timer!.cancel();
      Navigator.of(context).pushReplacementNamed('home');
    }
  }
}
