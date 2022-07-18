import 'package:flutter/material.dart';
import 'package:jane/view/signup_screen.dart';

import '../view/home_screen.dart';
import '../view/login_screen.dart';


class RouteGenerator
{


  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (context) => LoginScreen());
       case 'home':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case 'signup':
        return MaterialPageRoute(builder: (context) => SignupScreen());
      default:
        throw ('this route name does not exist');
    }
  }


}