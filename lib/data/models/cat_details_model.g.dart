// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatDetailsModel _$CatDetailsModelFromJson(Map<String, dynamic> json) =>
    CatDetailsModel(
      description: json['description'] as String? ?? 'no description',
      dogFriendly: json['dogFriendly'] as int? ?? -1,
      energyLevel: json['energyLevel'] as int? ?? -1,
      grooming: json['grooming'] as int? ?? -1,
      temperament: json['temperament'] as String? ?? 'no temperament',
    );

Map<String, dynamic> _$CatDetailsModelToJson(CatDetailsModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'dogFriendly': instance.dogFriendly,
      'energyLevel': instance.energyLevel,
      'grooming': instance.grooming,
      'temperament': instance.temperament,
    };
