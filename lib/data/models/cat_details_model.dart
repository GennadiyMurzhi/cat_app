import 'package:cats_app/domain/entities/cat_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_details_model.g.dart';

@JsonSerializable()
class CatDetailsModel extends CatDetails{
  @JsonKey(defaultValue: 'no description')
  final String description;

  @JsonKey(defaultValue: -1)
  final int dogFriendly;

  @JsonKey(defaultValue: -1)
  final int energyLevel;

  @JsonKey(defaultValue: -1)
  final int grooming;

  @JsonKey(defaultValue: 'no temperament')
  final String temperament;
  
  const CatDetailsModel({
    required this.description,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.temperament,
  }) : super(
     description: description,
     dogFriendly: dogFriendly,
     energyLevel: energyLevel,
     grooming: grooming,
     temperament: temperament
  );

  factory CatDetailsModel.fromJson(Map<String, dynamic> json) => _$CatDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatDetailsModelToJson(this);

}