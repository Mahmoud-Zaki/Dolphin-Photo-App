import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/dolphin_photos_bloc.dart';
import '../Utilities/Constants.dart';
import '../Utilities/General.dart';

class DolphinPhotos extends StatelessWidget {
  const DolphinPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.getScreenHeight(context)*0.6,
      width: Constants.getScreenWidth(context),
      child: BlocBuilder<DolphinPhotosBloc,DolphinPhotosState>(builder: (context,state){
        if(state is DolphinPhotosLoaded){
          return Image.network(state.currentPhotoURL,fit: BoxFit.fill);
        } else if(state is DolphinPhotosLoading){
          return General.customLoading();
        } else if(state is DolphinPhotosError){
          General.buildToast(msg: state.errorMsg);
          if(state.currentPhotoURL != null){
            return Image.network(state.currentPhotoURL!);
          }
          return const Center(child: Icon(Icons.error,color: Constants.primaryColor));
        } else if(state is DolphinPhotosRewinding){
          return Image.network(state.currentPhotoURL);
        } else if(state is DolphinPhotosPaused){
          return Image.network(state.currentPhotoURL);
        } else {
          return General.customLoading(isCircle: true);
        }
      }),
    );
  }
}