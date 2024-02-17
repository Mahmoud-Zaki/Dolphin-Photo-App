import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Constants.dart';

class General {
  static sizeBoxHorizontal(space) {
    return SizedBox(
      width: space,
    );
  }

  static sizeBoxVertical(space) {
    return SizedBox(
      height: space,
    );
  }

  static buildTxt({required String txt, Color color = Constants.black,
    double fontSize = 16.0, bool isBold = true}) {
    return Text(txt,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: color,
        fontFamily: "Montserrat",
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }

  static customLoading({Color color = Constants.primaryColor, bool isCircle = false,bool doubleBounce = false}) {
    return Center(
      child: (isCircle) ? SpinKitCircle(color: color, size: 64.0) : (doubleBounce) ?
      SpinKitDoubleBounce(color: color, size: 100) :
      SpinKitThreeBounce(color: color, size: 30.0),
    );
  }

  static void buildToast({required String msg}){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Constants.grayLight
    );
  }
}