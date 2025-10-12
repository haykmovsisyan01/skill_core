import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
@JsonSerializable()
class LoginRequestEntity with _$LoginRequestEntity {
  @override
  final String email;
  @override
  final String password;

  LoginRequestEntity({required this.email, required this.password});

  factory LoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestEntityToJson(this);
}
