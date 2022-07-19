import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jane/utils/constants.dart';
import 'package:jane/view_model/authentication_viewmodel.dart';
import 'package:validators/validators.dart';

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


  @override
  Widget build(BuildContext context) {
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


                    },
                    keyBoardType: TextInputType.emailAddress,),
                  const SizedBox(height: 24,),
                  const Text('Password'),
                  const SizedBox(height: 5,),
                  CustomPasswordTextField(isPassword: true, onsaved: (String? value) {


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

                  Button(buttonText: 'Login', isLoading: ref
                      .watch(provider)
                      .loading, onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
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
