import 'package:flutter/material.dart';




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




// class Button extends StatelessWidget {
//   const Button({Key? key, required this.buttonText, this.buttonEnabled = true,this.onPressed, this.isOutline}) : super(key: key);
//   final String buttonText;
//   final bool buttonEnabled;
//   final Function()? onPressed;
//
//   final bool? isOutline;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return TextButton(
//       child: Text(buttonText, style: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//
//       ),
//       style:
//
//       TextButton.styleFrom(
//         backgroundColor:buttonEnabled ? Palette.mainColor :Color(0xff7c7c7c),
//         padding: EdgeInsets.symmetric(vertical: 6.0, ),
//         minimumSize: Size(600.0,44.0),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//         onSurface: Colors.black45
//         ,
//       ),
//       onPressed:onPressed,
//     );
//   }
// }
