import 'package:flutter/material.dart';

import '../pallete.dart';




class Button extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final bool isEnabled;

  const Button({
    Key? key,
     this.onPressed,
    required this.buttonText,
    required this.isLoading,
    this.isEnabled = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    Size screenSize = MediaQuery.of(context).size;
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(isEnabled ? Palette.mainColor : Palette.mainColor.withOpacity(0.4)),
            minimumSize:
            MaterialStateProperty.all(Size(screenSize.width, 40))),
        onPressed: onPressed,
        child: Visibility(
            visible: isLoading,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   width: 50,
                // ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(

                    color: Colors.white,
                  ),
                ),
              ],
            ),
            replacement: Text(buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))));
  }
}




