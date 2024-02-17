import 'dart:async';
import 'package:dolphin_photo_app/Bloc/dolphin_photos_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DolphinPhotosBloc', () {
    late DolphinPhotosBloc dolphinPhotosBloc;

    setUp(() {
      dolphinPhotosBloc = DolphinPhotosBloc();
    });

    tearDown(() {
      dolphinPhotosBloc.close();
    });

    test('Initial state is DolphinPhotosInitial', () {
      expect(dolphinPhotosBloc.state, isA<DolphinPhotosInitial>());
    });

    test('Load Dolphin Photos', () async {
      final expectedStates = [
        isA<DolphinPhotosLoading>(),
        isA<DolphinPhotosLoaded>(),
      ];

      expectLater(
        dolphinPhotosBloc.stream,
        emitsInOrder(expectedStates),
      );

      dolphinPhotosBloc.add(LoadDolphinPhotos());
    });

    test('Pause', () async {
      final expectedStates = [
        isA<DolphinPhotosLoading>(),
        isA<DolphinPhotosLoaded>(),
        isA<DolphinPhotosPaused>(),
      ];

      expectLater(
        dolphinPhotosBloc.stream,
        emitsInOrder(expectedStates),
      );

      dolphinPhotosBloc.add(LoadDolphinPhotos());
      await Future.delayed(const Duration(seconds: 2), (){});
      dolphinPhotosBloc.add(PauseDolphinPhotos());
    });

    test('Resume', () async {
      final expectedStates = [
        isA<DolphinPhotosLoading>(),
        isA<DolphinPhotosLoaded>(),
        isA<DolphinPhotosPaused>(),
        isA<DolphinPhotosResumed>(),
      ];

      expectLater(
        dolphinPhotosBloc.stream,
        emitsInOrder(expectedStates),
      );

      dolphinPhotosBloc.add(LoadDolphinPhotos());
      await Future.delayed(const Duration(seconds: 2), (){});
      dolphinPhotosBloc.add(PauseDolphinPhotos());
      await Future.delayed(const Duration(seconds: 2), (){});
      dolphinPhotosBloc.add(ResumeDolphinPhotos());
    });

    test('Rewind', () async {
      final expectedStates = [
        isA<DolphinPhotosLoading>(),
        isA<DolphinPhotosLoaded>(),
        isA<DolphinPhotosLoading>(),
        isA<DolphinPhotosRewinding>(),
      ];

      expectLater(
        dolphinPhotosBloc.stream,
        emitsInOrder(expectedStates),
      );

      dolphinPhotosBloc.add(LoadDolphinPhotos());
      await Future.delayed(const Duration(seconds: 2), (){});
      dolphinPhotosBloc.add(RewindDolphinPhotos());
    });
  });
}