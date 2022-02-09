import 'package:cats_app/domain/entities/cat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class CatModel extends Cat{
  @JsonKey(defaultValue: 'no name')
  final String name;

  @JsonKey(defaultValue: 'unknown origin')
  final String origin;

  @JsonKey(
      name: 'image',
      defaultValue: 'no image',
      fromJson: _imageFromJson,
      toJson: _imageToJson,
  )
  final String imageUrl;

  @JsonKey(
    name: 'wikipedia_url',
    defaultValue: 'no wiki link',
  )
  final String wikiUrl;

  const CatModel({
    required String id,
    required this.name,
    required this.origin,
    required this.imageUrl,
    required this.wikiUrl,
  }) : super(
    id: id,
    name: name,
    origin: origin,
    imageUrl: imageUrl,
    wikiUrl: wikiUrl,
  );

  factory CatModel.fromJson(Map<String, dynamic> json) => _$CatModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatModelToJson(this);

}

String _imageFromJson(Map<String, dynamic> image) => image['url'] ?? '';

List<dynamic> _imageToJson(imageUrl) => [{'url' : imageUrl}];