import 'package:freezed_annotation/freezed_annotation.dart';

part 'reg_request.freezed.dart';
part 'reg_request.g.dart';

@freezed
@JsonSerializable()
class RegRequestEntity with _$RegRequestEntity {
  @override
  final String email;
  @override
  final String password;

  RegRequestEntity({required this.email, required this.password});

  factory RegRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$RegRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegRequestEntityToJson(this);
}
