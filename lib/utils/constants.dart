import 'package:flutter/material.dart';
import 'package:jane/utils/pallete.dart';


class Constants{

  static const EMAILADDRESS = "EMAILADDRESS";
  static const LASTNAME = "LASTNAME";
  static const FIRSTNAME = "FIRSTNAME";
  static const IS_LOGGED_IN = "IS_LOGGED_IN";


  static const  ksidePadding = 24.0;
  static const  kTopPadding = 64.0;
}


final outline = OutlineInputBorder(
  borderSide: BorderSide(color: Palette.dividerColor, width: 1.0),
  borderRadius: BorderRadius.circular(5.0),
);
final kInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color:  Palette.dividerColor, width: 1),
    borderRadius: BorderRadius.circular(5.0),
  ),
  contentPadding: const EdgeInsets.symmetric( horizontal: 2.0, vertical: 2),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Palette.dividerColor, width: 1),
    borderRadius: BorderRadius.circular(5.0),
  ),

  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color:Palette.dividerColor, ),
    borderRadius: BorderRadius.circular(5.0),
  ),
  counterText: '',





);