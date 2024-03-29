
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class Utils{





   static showSnackBar(String text, BuildContext context) {
    final snackbar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }

  static void showMaterialDialog(BuildContext context,{ String? title,String? subtitle, Function()? onpressed }) {
     showDialog(
         context: context,
         builder: (context) {
           return AlertDialog(
             title: Text(title!),
             content: Text(subtitle!),
             actions: <Widget>[
               // TextButton(
               //     onPressed: () {
               //
               //     },
               //     child: Text('Close')),
               TextButton(
                 onPressed: onpressed,
                 child: Text('Logout'),
               )
             ],
           );
         });
   }

   static String? emailvalidation(String? text) {
     if (text == null || text.isEmpty) {
       return 'Email Required';
     }
     else if (!isEmail(text)) {
       return 'Please enter a valid email';
     }
     return null;
   }
}