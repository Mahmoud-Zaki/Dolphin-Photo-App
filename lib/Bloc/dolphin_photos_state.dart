part of 'dolphin_photos_bloc.dart';

@immutable
abstract class DolphinPhotosState {}

class DolphinPhotosInitial extends DolphinPhotosState {}

class DolphinPhotosLoading extends DolphinPhotosState {}

class DolphinPhotosLoaded extends DolphinPhotosState {
  final String currentPhotoURL;
  DolphinPhotosLoaded({required this.currentPhotoURL});
}

class DolphinPhotosPaused extends DolphinPhotosState {
  final String currentPhotoURL;
  DolphinPhotosPaused({required this.currentPhotoURL});
}

class DolphinPhotosResumed extends DolphinPhotosState {}

class DolphinPhotosRewinding extends DolphinPhotosState {
  final String currentPhotoURL;
  DolphinPhotosRewinding({required this.currentPhotoURL});
}

class DolphinPhotosError extends DolphinPhotosState{
  final String errorMsg;
  final String? currentPhotoURL;
  DolphinPhotosError({required this.errorMsg,this.currentPhotoURL});
}