// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      rank: json['rank'] as int?,
      isNew: json['isNew'] as bool?,
      isActive: json['isActive'] as bool?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      description: json['description'] as String?,
      message: json['message'] as String?,
      openSource: json['openSource'] as bool?,
      startedAt: json['startedAt'] as String?,
      developmentStatus: json['developmentStatus'] as String?,
      hardwareWallet: json['hardwareWallet'] as bool?,
      proofType: json['proofType'] as String?,
      orgStructure: json['orgStructure'] as String?,
      hashAlgorithm: json['hashAlgorithm'] as String?,
      firstDataAt: json['firstDataAt'] as String?,
      lastDataAt: json['lastDataAt'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'rank': instance.rank,
      'isNew': instance.isNew,
      'isActive': instance.isActive,
      'type': instance.type,
      'logo': instance.logo,
      'description': instance.description,
      'message': instance.message,
      'openSource': instance.openSource,
      'startedAt': instance.startedAt,
      'developmentStatus': instance.developmentStatus,
      'hardwareWallet': instance.hardwareWallet,
      'proofType': instance.proofType,
      'orgStructure': instance.orgStructure,
      'hashAlgorithm': instance.hashAlgorithm,
      'firstDataAt': instance.firstDataAt,
      'lastDataAt': instance.lastDataAt,
      'tags': instance.tags,
    };
