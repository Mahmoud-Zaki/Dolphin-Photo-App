import 'package:flutter/material.dart';
import 'package:dolphin_photo_app/Utilities/General.dart';

import '../Utilities/Constants.dart';

class MyBtn extends StatelessWidget {
  final String txt;
  final Function function;
   const MyBtn({super.key, required this.txt, required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){function();},
      style: ElevatedButton.styleFrom(backgroundColor: Constants.grayLight),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.getScreenWidth(context)*0.05),
        child: General.buildTxt(txt: txt,color: Constants.darkBlueLight,isBold: false,fontSize: 18.0),
      ),
    );
  }
}
