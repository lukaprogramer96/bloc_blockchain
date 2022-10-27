// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'crypto_model.g.dart';

@JsonSerializable()
class CryptoModel {
  final String id;
  final String name;
  final String symbol;
  final int rank;
  @JsonKey(name: 'is_new')
  final bool? isnew; //@JsonKey(name: 'first_name')
  @JsonKey(name: 'is_active')
  final bool? isactive; //@JsonKey(name: 'first_name')
  final String type;

  CryptoModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.isnew,
    required this.isactive,
    required this.type,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CryptoModelToJson(this);
}
