import 'package:json_annotation/json_annotation.dart';
import 'package:skill_core/domain/entities/token/token.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponseEntity {
  final String message;
  final bool failed;
  final TokenEntity? token;

  LoginResponseEntity({
    required this.message,
    required this.failed,
    this.token,
  });

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);
}
