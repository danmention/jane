import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';


class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({Key? key,this.onchange, this.hintText, this.controller,
    this.validator, this.enabled,
    this.keyBoardType, this.maxLength,this.isPassword, this.obscureText, this.labelText, this.sufficeIcon, this.onsaved}) ;
  final String? hintText;
  final TextEditingController? controller;
  final String? labelText;
  final Function() ?validator;
  final TextInputType? keyBoardType;
  final bool? obscureText;
  final bool? enabled;
  final int? maxLength;
  final Widget? sufficeIcon;
  final bool? isPassword;
  final Function(String)? onchange;
  final Function(String?)? onsaved;


  @override
  State<CustomPasswordTextField> createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  // Initially password is obscure

  bool _obscureText = true;





  Widget toggle(){
    return GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child:  Image.asset('assets/icons/eye.png',width: 16.0,height: 16.0,)
    );
  }

  @override
  Widget build(BuildContext context) {




    return TextFormField(
        controller: widget.controller,
        onChanged: widget.onchange,
        onSaved: widget.onsaved,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Required';
          }
          return null;
        },
        keyboardType: widget.keyBoardType == null ? TextInputType.text : widget.keyBoardType,
       obscureText: _obscureText
       ,
        decoration:

        kInputDecoration.copyWith(
          errorMaxLines: 3,
          hintText: widget.hintText,
          labelText: widget.labelText,
          suffixIcon: toggle()









        )
    );
  }
}