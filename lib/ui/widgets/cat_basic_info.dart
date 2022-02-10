import 'package:cats_app/core/const/const_string.dart';
import 'package:cats_app/ui/screens/cubit/screen_cubit.dart';
import 'package:cats_app/ui/screens/details_screen.dart';
import 'package:cats_app/ui/widgets/cat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CatBasicInfo extends StatelessWidget{
  final String? apiId;
  final int? listId;
  final bool needPushButton;
  final String name;
  final String origin;
  final String imageUrl;
  final String wikiUrl;

  const CatBasicInfo({
    Key? key,
    this.apiId,
    this.listId,
    required this.needPushButton,
    required this.name,
    required this.origin,
    required this.imageUrl,
    required this.wikiUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          (imageUrl != 'no image' || imageUrl != '') ?
          Image.network(
            imageUrl,
            height: MediaQuery.of(context).size.width / 2,
            errorBuilder: (context, exception, stackTrace){
                return Center(
                  child: Text(
                    exception.toString(),
                    style: const TextStyle(fontSize: 24),
                  )
                );
            },
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Column(
                    children: const [
                      LinearProgressIndicator(),
                      SizedBox(height: 15,),
                      Text('Image loading ...', style: TextStyle(fontSize: 14),),
                      SizedBox(height: 15,),
                ]
              );
            },
          ) : Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width / 2,
            child: const Text('no image', style: TextStyle(fontSize: 24)),
          ),
          Text(name != '' ? name : noInfoAbout),
          Text(origin != '' ? 'origin: $origin'  : noInfoAbout),
          imageUrl != '' ? CatButton(
            label: 'Open wiki',
            onPressed: () => _openWiki(wikiUrl),
          )
          : Container(
            alignment: Alignment.center,
            child :const Text('no wiki',
              style: TextStyle(fontSize: 16),
            ),
          ),
          needPushButton ? CatButton(
            label: 'Details',
            onPressed: () => _openDetails(apiId!, listId!, context)
          ) : Container()
        ],
      ),
    );
  }

}

void _openWiki(String wikiUrl) async {
  if (!await launch(wikiUrl)) throw 'Could not launch $wikiUrl';
}

void _openDetails(String apiId, int listId, BuildContext context){
  BlocProvider.of<ScreenCubit>(context).loadOfCatDetails(apiId, listId);
  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen()));
}