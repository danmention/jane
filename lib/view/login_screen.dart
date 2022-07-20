import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jane/model/services/local_auth/local_auth_api.dart';
import 'package:jane/utils/constants.dart';
import 'package:jane/view_model/authentication_viewmodel.dart';
import 'package:validators/validators.dart';

import '../model/request/login_request.dart';
import '../utils/pallete.dart';
import '../utils/reuseable_widgets/custom_button.dart';
import '../utils/reuseable_widgets/custom_password_textfield.dart';
import '../utils/reuseable_widgets/custom_textfield.dart';
import '../utils/utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var _formkey = GlobalKey<FormState>();
  final provider = ChangeNotifierProvider((ref) => AuthenticationViewModel());
  var loginRequest =  LoginRequest();

  @override
  Widget build(BuildContext context) {
    final providerValue  = ref.watch(provider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.ksidePadding),
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(height: 120,),
                  const Text('Email Address',),
                  const SizedBox(height: 5,),
                  CustomTextField(
                    validator: Utils.emailvalidation,
                    onsaved: (String? value) {

                      loginRequest.email =  value!.trim();
                    },
                    keyBoardType: TextInputType.emailAddress,),
                  const SizedBox(height: 24,),
                  const Text('Password'),
                  const SizedBox(height: 5,),
                  CustomPasswordTextField(isPassword: true, onsaved: (String? value) {
                    loginRequest.password =  value!.trim();

                  },),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text('You don\'t have account?')
                    ,GestureDetector(
                        onTap:(){
                          Navigator.pushNamed(context, 'signup');
                        },

                          child: Text(' Signup', style: TextStyle(fontWeight: FontWeight.bold, color: Palette.mainColor),))
                  ],),
                  const SizedBox(height: 205,),

                  Button(buttonText: 'Login', isLoading:  providerValue
                      .loading, onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      providerValue.login(loginRequest, context);
                    }
                  },),

                  Align(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      // <-- TextButton
                      onPressed: () {
                        providerValue.loginWithBiometric(context);


                      },
                      icon: Icon(

                        Icons.fingerprint,
                        size: 54.0,
                        color: Palette.mainColor,
                      ),
                      label: Text('', style: TextStyle(color:Palette.mainColor, ),),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
