import 'package:json_annotation/json_annotation.dart';

import '../tags_model/tags_model.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel {
  final String? id;
  final String? name;
  final String? symbol;
  final int? rank;
  final bool? isNew;
  final bool? isActive;
  final String? type;
  final String? logo;
  final String? description;
  final String? message;
  final bool? openSource;
  final String? startedAt;
  final String? developmentStatus;
  final bool? hardwareWallet;
  final String? proofType;
  final String? orgStructure;
  final String? hashAlgorithm;
  final String? firstDataAt;
  final String? lastDataAt;
  final List<TagsModel>? tags;

  CoinModel(
      {this.id,
      this.name,
      this.symbol,
      this.rank,
      this.isNew,
      this.isActive,
      this.type,
      this.logo,
      this.description,
      this.message,
      this.openSource,
      this.startedAt,
      this.developmentStatus,
      this.hardwareWallet,
      this.proofType,
      this.orgStructure,
      this.hashAlgorithm,
      this.firstDataAt,
      this.lastDataAt,
      this.tags});

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
}
