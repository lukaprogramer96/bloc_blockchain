// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagsModel _$TagsModelFromJson(Map<String, dynamic> json) => TagsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      coin_counter: json['coin_counter'] as int,
      ico_counter: json['ico_counter'] as int,
    );

Map<String, dynamic> _$TagsModelToJson(TagsModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coin_counter': instance.coin_counter,
      'ico_counter': instance.ico_counter,
    };
