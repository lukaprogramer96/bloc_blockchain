// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchanges_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangesModel _$ExchangesModelFromJson(Map<String, dynamic> json) =>
    ExchangesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      active: json['active'] as bool?,
      websiteStatus: json['websiteStatus'] as bool?,
      apiStatus: json['apiStatus'] as bool?,
      message: json['message'] as String?,
      marketsDataFetched: json['marketsDataFetched'] as bool?,
      adjustedRank: json['adjustedRank'] as int?,
      reportedRank: json['reportedRank'] as int?,
      currencies: json['currencies'] as int?,
      markets: json['markets'] as int?,
      lastUpdated: json['lastUpdated'] as String?,
      confidenceScore: json['confidenceScore'] as int?,
    );

Map<String, dynamic> _$ExchangesModelToJson(ExchangesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
      'websiteStatus': instance.websiteStatus,
      'apiStatus': instance.apiStatus,
      'message': instance.message,
      'marketsDataFetched': instance.marketsDataFetched,
      'adjustedRank': instance.adjustedRank,
      'reportedRank': instance.reportedRank,
      'currencies': instance.currencies,
      'markets': instance.markets,
      'lastUpdated': instance.lastUpdated,
      'confidenceScore': instance.confidenceScore,
    };
