// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_void_to_null, unnecessary_question_mark
import 'package:json_annotation/json_annotation.dart';

part 'exchanges_model.g.dart';

@JsonSerializable()
class ExchangesModel {
  final String? id;
  final String? name;
  final String? description;
  final bool? active;
  final bool? websiteStatus;
  final bool? apiStatus;
  final String? message;
  final bool? marketsDataFetched;
  final int? adjustedRank;
  final int? reportedRank;
  final int? currencies;
  final int? markets;
  final String? lastUpdated;
  final int? confidenceScore;

  ExchangesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.active,
    required this.websiteStatus,
    required this.apiStatus,
    required this.message,
    required this.marketsDataFetched,
    required this.adjustedRank,
    required this.reportedRank,
    required this.currencies,
    required this.markets,
    required this.lastUpdated,
    required this.confidenceScore,
  });

  factory ExchangesModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangesModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExchangesModelToJson(this);
}
