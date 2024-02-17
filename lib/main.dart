import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dolphin_photo_app/Pages/DolphinPhotosPage.dart';
import 'Bloc/dolphin_photos_bloc.dart';
import 'Utilities/Constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DolphinPhotosBloc()..add(LoadDolphinPhotos()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dolphin',
        color: Constants.primaryColor,
        home: DolphinPhotosPage(),
      ),
    );
  }
}