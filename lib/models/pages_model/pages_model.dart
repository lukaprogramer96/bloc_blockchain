// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_reso_coder/models/user_model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pages_model.g.dart';

@JsonSerializable()
class PagesModel {
  final int page;
  @JsonKey(name: 'per_page')
  final int perPage;
  final int total;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final List<UserModel> data;

  PagesModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory PagesModel.fromJson(Map<String, dynamic> json) =>
      _$PagesModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PagesModelToJson(this);
}
