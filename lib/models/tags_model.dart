import 'package:json_annotation/json_annotation.dart';

part 'tags_model.g.dart';

@JsonSerializable()
class TagsModel {
  final String id;
  final String name;
  final int coin_counter;
  final int ico_counter;

  TagsModel({
    required this.id,
    required this.name,
    required this.coin_counter,
    required this.ico_counter,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) =>
      _$TagsModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TagsModelToJson(this);
}
