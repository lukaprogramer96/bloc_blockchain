// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'twitter_model.g.dart';

@JsonSerializable()
class TwitterModel {
  final DateTime? date;
  @JsonKey(name: 'user_name')
  final String? username;
  final String? userimagelink;
  final String? status;
  final bool? isretweet;
  final int? retweetcount;
  final int? likecount;
  final String? statuslink;
  final String? statusid;

  TwitterModel({
    this.date,
    this.username,
    this.userimagelink,
    this.status,
    this.isretweet,
    this.retweetcount,
    this.likecount,
    this.statuslink,
    this.statusid,
  });

  factory TwitterModel.fromJson(Map<String, dynamic> json) =>
      _$TwitterModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TwitterModelToJson(this);
}
