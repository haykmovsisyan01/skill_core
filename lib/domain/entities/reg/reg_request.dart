import 'package:json_annotation/json_annotation.dart';

part 'reg_request.g.dart';

@JsonSerializable()
class RegRequestEntity {
  final String email;
  final String password;

  RegRequestEntity({required this.email, required this.password});

  factory RegRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$RegRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegRequestEntityToJson(this);
}
