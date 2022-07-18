import 'package:flutter/material.dart';

import '../view/HomeScreen.dart';
import '../view/LoginScreen.dart';


class RouteGenerator
{


  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginScreen());
       case 'home':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        throw ('this route name does not exist');
    }
  }


}