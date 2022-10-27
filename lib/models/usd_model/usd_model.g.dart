// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usd_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

USD _$USDFromJson(Map<String, dynamic> json) => USD(
      reportedVolume24h: json['reportedVolume24h'] as int?,
      adjustedVolume24h: json['adjustedVolume24h'] as int?,
      reportedVolume7d: json['reportedVolume7d'] as int?,
      adjustedVolume7d: json['adjustedVolume7d'] as int?,
      reportedVolume30d: json['reportedVolume30d'] as int?,
      adjustedVolume30d: json['adjustedVolume30d'] as int?,
    );

Map<String, dynamic> _$USDToJson(USD instance) => <String, dynamic>{
      'reportedVolume24h': instance.reportedVolume24h,
      'adjustedVolume24h': instance.adjustedVolume24h,
      'reportedVolume7d': instance.reportedVolume7d,
      'adjustedVolume7d': instance.adjustedVolume7d,
      'reportedVolume30d': instance.reportedVolume30d,
      'adjustedVolume30d': instance.adjustedVolume30d,
    };
