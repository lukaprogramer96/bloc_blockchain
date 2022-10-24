// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'crypto_model.g.dart';

@JsonSerializable()
class CryptoModel {
  final String id;
  final String name;
  final String symbol;
  final int rank;
  final bool is_new; //@JsonKey(name: 'first_name')
  final bool is_active; //@JsonKey(name: 'first_name')
  final String type;

  CryptoModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.is_new,
    required this.is_active,
    required this.type,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CryptoModelToJson(this);
}
