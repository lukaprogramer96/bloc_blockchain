import 'package:json_annotation/json_annotation.dart';

part 'usd_model.g.dart';

@JsonSerializable()
class USD {
  final int? reportedVolume24h;
  final int? adjustedVolume24h;
  final int? reportedVolume7d;
  final int? adjustedVolume7d;
  final int? reportedVolume30d;
  final int? adjustedVolume30d;

  USD(
      {required this.reportedVolume24h,
      required this.adjustedVolume24h,
      required this.reportedVolume7d,
      required this.adjustedVolume7d,
      required this.reportedVolume30d,
      required this.adjustedVolume30d});

  factory USD.fromJson(Map<String, dynamic> json) => _$USDFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$USDToJson(this);
}
