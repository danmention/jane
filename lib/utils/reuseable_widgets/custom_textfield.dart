import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane/utils/constants.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,this.onchange, this.hintText, this.controller,
    this.validator, this.enabled,
    this.keyBoardType, this.maxLength,this.isPassword, this.obscureText, this.labelText, this.sufficeIcon, this.isEmail, this.onsaved}) ;
  final String? hintText;
  final TextEditingController? controller;
  final String? labelText;

  final TextInputType? keyBoardType;
  final bool? obscureText;
  final bool? enabled;
  final int? maxLength;
  final IconData? sufficeIcon;
  final bool? isPassword;
  final bool? isEmail;

  final Function(String)? onchange;
  final Function(String?)? onsaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: onchange,
        onSaved: onsaved,

        validator:  (text) {
          if (text == null || text.isEmpty) {
            return 'Required';
          }
          return null;
        },
        keyboardType: keyBoardType == null ? TextInputType.text : keyBoardType,
         obscureText: isPassword == null?false:true,
        decoration:

        kInputDecoration.copyWith(
          errorMaxLines: 3,
          hintText: hintText,
          labelText: labelText,
          suffixIcon: sufficeIcon == null?null:Icon(sufficeIcon),

        )
    );
  }
}