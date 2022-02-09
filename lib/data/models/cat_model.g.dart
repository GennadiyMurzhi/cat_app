// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'no name',
      origin: json['origin'] as String? ?? 'unknown origin',
      imageUrl: json['image'] == null
          ? 'no image'
          : _imageFromJson(json['image'] as Map<String, dynamic>),
      wikiUrl: json['wikipedia_url'] as String? ?? 'no wiki link',
    );

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'origin': instance.origin,
      'image': _imageToJson(instance.imageUrl),
      'wikipedia_url': instance.wikiUrl,
    };
