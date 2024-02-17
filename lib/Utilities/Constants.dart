import 'dart:async';
import 'package:flutter/material.dart';

class Constants {

  static const String baseURL = "https://api.unsplash.com/photos/random?";
  static const String photoName = "dolphin";
  static const String clientID = "UTSXbxROjpDFjQkR-bjVlGxsoVLFX-CWRTat8gc7OkI";

  static const Color primaryColor = Color(0xff496973);
  static const Color darkBlueLight = Color(0xff2C2C2C);
  static const Color grayLight = Color(0xffb9c5c9);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static double getScreenHeight(context){
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(context){
    return MediaQuery.of(context).size.width;
  }
}