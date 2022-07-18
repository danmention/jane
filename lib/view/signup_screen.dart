import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jane/utils/constants.dart';
import 'package:jane/utils/reuseable_widgets/custom_button.dart';

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


                  const SizedBox(height: 124,),
                  const Text('Full name'),
                  const SizedBox(height: 5,),
                  CustomTextField( onsaved: (String? value) {


                  },),

                  const SizedBox(height: 20,),
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
                  CustomTextField(isPassword: true, onsaved: (String? value) {


                  },),


                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Already have an account?')
                      ,GestureDetector(
                          onTap:(){
                          Navigator.pushNamed(context, 'login');
                          },

                          child: Text(' Login', style: TextStyle(fontWeight: FontWeight.bold),))
                    ],),
                  const SizedBox(height: 205,),

                  Button(buttonText: 'Signup', isLoading: ref
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
