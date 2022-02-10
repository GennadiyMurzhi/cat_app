import 'package:cats_app/core/const/const_string.dart';
import 'package:flutter/material.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailText(
              title: 'Dog friendly: ',
              text: dogFriendly != -1 ? dogFriendly.toString() : noInfoAbout),
            DetailText(
                title: 'Energy level: ',
                text: energyLevel != -1 ? energyLevel.toString() : noInfoAbout),
            DetailText(
                title: 'Grooming: ',
                text: grooming != -1 ? grooming.toString() : noInfoAbout),
            DetailText(
                title: 'Temperament: ',
                text: temperament != '' ? temperament : noInfoAbout),
            DetailText(
                title: 'Description: ',
                text: description != '' ? description : noInfoAbout),
          ],
      );
  }

}

class DetailText extends StatelessWidget {
  final String title;
  final String text;

  const DetailText({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: Color(0xFF000000)),
            children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              fontFamily: 'Bahnschrift',
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: text,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
        ]));
  }
}