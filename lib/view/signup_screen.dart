import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jane/utils/constants.dart';
import 'package:jane/utils/pallete.dart';
import 'package:jane/utils/reuseable_widgets/custom_button.dart';
import 'package:jane/utils/reuseable_widgets/custom_password_textfield.dart';

import '../model/request/login_request.dart';
import '../model/request/signup_request.dart';
import '../utils/reuseable_widgets/custom_textfield.dart';
import '../utils/utils.dart';
import '../view_model/authentication_viewmodel.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  var _formkey = GlobalKey<FormState>();
  final provider = ChangeNotifierProvider((ref) => AuthenticationViewModel());
  SignupRequest signupRequest =  SignupRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.ksidePadding, vertical:  Constants.kTopPadding,),
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Text('Signup', style: TextStyle(fontWeight: FontWeight.bold, fontSize:30 ),),
                  const SizedBox(height: 30,),
                  const Text('Full name'),
                  const SizedBox(height: 5,),
                  CustomTextField( onsaved: (String? value) {
                    signupRequest.fullname =  value;

                  },),

                  const SizedBox(height: 20,),
                  const Text('Email Address',),
                  const SizedBox(height: 5,),
                  CustomTextField(
                    validator: Utils.emailvalidation,
                    onsaved: (String? value) {
                      signupRequest.email =  value!.trim();

                    },
                    keyBoardType: TextInputType.emailAddress,),
                  const SizedBox(height: 24,),
                  const Text('Password'),
                  const SizedBox(height: 5,),
                  CustomPasswordTextField(isPassword: true, onsaved: (String? value) {

                    signupRequest.password =  value!.trim();
                  },),


                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Already have an account?')
                      ,GestureDetector(
                          onTap:(){
                          Navigator.pushNamed(context, 'login', );
                          },

                          child: Text(' Login', style: TextStyle(fontWeight: FontWeight.bold, color: Palette.mainColor),))
                    ],),
                  const SizedBox(height: 150,),

                  Button(buttonText: 'Signup', isLoading: ref
                      .watch(provider)
                      .loading, onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      ref.read(provider).signup(signupRequest, context);

                    }
                  },)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
