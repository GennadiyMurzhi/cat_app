import 'package:cats_app/service_locator.dart';
import 'package:cats_app/ui/screens/cubit/screen_cubit.dart';
import 'package:cats_app/ui/screens/details_screen.dart';
import 'package:cats_app/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenCubit>(
      create: (context) => locator<ScreenCubit>(),
      child: BlocBuilder<ScreenCubit, ScreenState>(
        builder: (context, state) => MaterialApp(
            title: 'Cat app',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomeScreen()),
      ),
    );
  }
}
