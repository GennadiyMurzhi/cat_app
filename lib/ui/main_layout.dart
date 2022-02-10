import 'package:cats_app/ui/screens/cubit/screen_cubit.dart';
import 'package:cats_app/ui/widgets/cat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget{
  final String title;
  final bool needPop;
  final Widget body;

  MainLayout({
    Key? key,
    required this.body,
    required this.title,
    required this.needPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CatAppBar(
        title: title,
        needPop: needPop,
      ),
      body: BlocProvider.of<ScreenCubit>(context).state is ScreenLoading
          ? const Center(child: LinearProgressIndicator())
          : BlocProvider.of<ScreenCubit>(context).state is APIError ? const Center(child: Text('APIError'))
          : BlocProvider.of<ScreenCubit>(context).state is ListEmptyError ? const Center(child: Text('ListEmptyError'))
          : BlocProvider.of<ScreenCubit>(context).state is ScreenLoaded ?
          body
          : const Center(child: Text('Something\'s not right'))
    );
  }

}