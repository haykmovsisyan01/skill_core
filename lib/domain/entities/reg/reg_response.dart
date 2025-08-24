import 'package:json_annotation/json_annotation.dart';

part 'reg_response.g.dart';

@JsonSerializable()
class RegResponseEntity {
  final String message;
  final bool failed;

  RegResponseEntity({required this.message, required this.failed});

  factory RegResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RegResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegResponseEntityToJson(this);
}
