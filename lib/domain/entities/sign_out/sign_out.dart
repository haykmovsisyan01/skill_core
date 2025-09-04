import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_out.freezed.dart';
part 'sign_out.g.dart';

@freezed
@JsonSerializable()
class SignOutEntity with _$SignOutEntity {
  final String message;
  final bool failed;

  SignOutEntity({required this.message, required this.failed});

  factory SignOutEntity.fromJson(Map<String, dynamic> json) =>
      _$SignOutEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignOutEntityToJson(this);
}
