// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwitterModel _$TwitterModelFromJson(Map<String, dynamic> json) => TwitterModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      username: json['username'] as String?,
      userimagelink: json['userimagelink'] as String?,
      status: json['status'] as String?,
      isretweet: json['isretweet'] as bool?,
      retweetcount: json['retweetcount'] as int?,
      likecount: json['likecount'] as int?,
      statuslink: json['statuslink'] as String?,
      statusid: json['statusid'] as String?,
    );

Map<String, dynamic> _$TwitterModelToJson(TwitterModel instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'username': instance.username,
      'userimagelink': instance.userimagelink,
      'status': instance.status,
      'isretweet': instance.isretweet,
      'retweetcount': instance.retweetcount,
      'likecount': instance.likecount,
      'statuslink': instance.statuslink,
      'statusid': instance.statusid,
    };
