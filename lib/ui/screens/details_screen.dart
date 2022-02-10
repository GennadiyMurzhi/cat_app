import 'package:cats_app/service_locator.dart';
import 'package:cats_app/ui/main_layout.dart';
import 'package:cats_app/ui/screens/cubit/screen_cubit.dart';
import 'package:cats_app/ui/widgets/cat_basic_info.dart';
import 'package:cats_app/ui/widgets/cat_details_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget{
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
              title: 'Cat details',
              needPop: true,
              body: (BlocProvider.of<ScreenCubit>(context).state is ScreenLoaded)
                  ?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CatBasicInfo(
                      needPushButton: false,
                      name: (BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).cat!.name,
                      origin: (BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).cat!.origin,
                      imageUrl: (BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).cat!.imageUrl,
                      wikiUrl: (BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).cat!.wikiUrl,
                    ),
                    CatDetailsInfo(
                      description:(BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).catDetails!.description,
                      dogFriendly:(BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).catDetails!.dogFriendly,
                      energyLevel:(BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).catDetails!.energyLevel,
                      grooming:(BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).catDetails!.grooming,
                      temperament:(BlocProvider.of<ScreenCubit>(context).state as ScreenLoaded).catDetails!.temperament,
                    ),
                  ],
                ),
              )
              : Container()
    );
  }

}