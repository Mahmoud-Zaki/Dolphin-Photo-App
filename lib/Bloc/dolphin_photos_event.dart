part of 'dolphin_photos_bloc.dart';

@immutable
abstract class DolphinPhotosEvent {}

class LoadDolphinPhotos extends DolphinPhotosEvent {}

class PauseDolphinPhotos extends DolphinPhotosEvent {}

class ResumeDolphinPhotos extends DolphinPhotosEvent {}

class RewindDolphinPhotos extends DolphinPhotosEvent{}