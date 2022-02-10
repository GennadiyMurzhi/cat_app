import 'package:cats_app/core/const/const_string.dart';
import 'package:flutter/cupertino.dart';

class CatDetailsInfo extends StatelessWidget{
  final String description;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final String temperament;

  const CatDetailsInfo({
    Key? key,
    required this.description,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.temperament,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text('Dog friendly: ' + (dogFriendly != -1 ? dogFriendly.toString() : noInfoAbout) + '\n'),
          Text('Energy level: ' + (energyLevel != -1 ? energyLevel.toString() : noInfoAbout) + '\n'),
          Text('Grooming: ' + (grooming != -1 ? grooming.toString() : noInfoAbout) + '\n'),
          Text('Temperament: ' + (temperament != '' ? temperament : noInfoAbout) + '\n'),
          Text('Description: ' + (description != '' ? description : noInfoAbout) + '\n'),
        ],
    );
  }

}