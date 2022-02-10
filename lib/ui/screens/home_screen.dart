import 'package:cats_app/service_locator.dart';
import 'package:cats_app/ui/screens/cubit/screen_cubit.dart';
import 'package:cats_app/ui/main_layout.dart';
import 'package:cats_app/ui/widgets/list_of_cats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var state = BlocProvider.of<ScreenCubit>(context).state;

    return MainLayout(
            title: 'Cat list',
            needPop: false,
            body: (BlocProvider.of<ScreenCubit>(context).state is ScreenLoaded)
                    ? ListOfCats(
                        listOfCat: (BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).listOfCats!)
                    : Container(),

    );
  }

}