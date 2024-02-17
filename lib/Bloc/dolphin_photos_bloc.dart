import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../Services/API.dart';
part 'dolphin_photos_event.dart';
part 'dolphin_photos_state.dart';

class DolphinPhotosBloc extends Bloc<DolphinPhotosEvent, DolphinPhotosState> {
  Timer _timer = Timer(const Duration(seconds: 0), () {});
  bool _isPaused = false;
  bool _isRewind = false;
  int _currentIndex = 0;
  final List<String> _dolphinPhotos = [];

  DolphinPhotosBloc() : super(DolphinPhotosInitial()) {
    on<LoadDolphinPhotos>((event, emit) async {
      emit(DolphinPhotosLoading());
      try {
        String photo = await API.fetchRandomDolphinPhoto();
        if(photo == "Failed"){
          emit(DolphinPhotosError(errorMsg: 'Failed to load Dolphin photo'));
        } else {
          _dolphinPhotos.insert(0, photo);
          if(_dolphinPhotos.length > 6){_dolphinPhotos.removeLast();}
          _startTimer();
          emit(DolphinPhotosLoaded(currentPhotoURL: photo));
        }
      } catch (e) {
        emit(DolphinPhotosError(errorMsg: 'Failed to load Dolphin photo'));
      }
    });

    on<PauseDolphinPhotos>((event, emit) {
      _isPaused = true;
      emit(DolphinPhotosPaused(currentPhotoURL: _dolphinPhotos[0]));
    });

    on<ResumeDolphinPhotos>((event, emit) {
      _currentIndex = 0;
      _isPaused = false;
      _isRewind = false;
      emit(DolphinPhotosResumed());
    });

    on<RewindDolphinPhotos>((event, emit) {
      _isRewind = true;
      _isPaused = false;
      if(_currentIndex < _dolphinPhotos.length){
        emit(DolphinPhotosLoading());
        _startTimer();
        emit(DolphinPhotosRewinding(currentPhotoURL: _dolphinPhotos[_currentIndex]));
      } else {
        emit(DolphinPhotosError(errorMsg: 'Cannot remember any more Dolphins',currentPhotoURL: _dolphinPhotos.last));
      }
    });
  }
  void _startTimer() {
    _timer.cancel();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      if(!_isPaused){
        if(_isRewind){
          _currentIndex++;
          add(RewindDolphinPhotos());
        } else {
          add(LoadDolphinPhotos());
        }
      }
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}