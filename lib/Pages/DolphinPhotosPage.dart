import 'package:flutter/material.dart';
import 'package:dolphin_photo_app/Componants/DolphinPhotos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dolphin_photo_app/Componants/MyBtn.dart';
import 'package:dolphin_photo_app/Utilities/Constants.dart';
import 'package:dolphin_photo_app/Utilities/General.dart';
import '../Bloc/dolphin_photos_bloc.dart';

class DolphinPhotosPage extends StatelessWidget{
  const DolphinPhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          centerTitle: true,
          title: General.buildTxt(txt: 'Dolphin Photos',fontSize: 20.0,color: Constants.white)
        ),
        body: Column(
          children: [
            const DolphinPhotos(),
            General.sizeBoxVertical(Constants.getScreenHeight(context)*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyBtn(txt: 'Pause',function: (){
                  context.read<DolphinPhotosBloc>().add(PauseDolphinPhotos());
                }),
                General.sizeBoxHorizontal(Constants.getScreenWidth(context)*0.04),
                MyBtn(txt: 'Play',function: (){
                  context.read<DolphinPhotosBloc>().add(ResumeDolphinPhotos());
                }),
              ],
            ),
            General.sizeBoxVertical(Constants.getScreenHeight(context)*0.02),
            MyBtn(txt: 'Rewind',function: (){
               context.read<DolphinPhotosBloc>().add(RewindDolphinPhotos());
            }),
            General.sizeBoxVertical(Constants.getScreenHeight(context)*0.1),
          ],
        ),
      )
    );
  }
}