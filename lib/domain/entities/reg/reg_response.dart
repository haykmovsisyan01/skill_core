import 'package:freezed_annotation/freezed_annotation.dart';

part 'reg_response.freezed.dart';
part 'reg_response.g.dart';

@freezed
@JsonSerializable()
class RegResponseEntity with _$RegResponseEntity {
  @override
  final String message;
  @override
  final String? uid;
  @override
  final bool failed;

  RegResponseEntity({required this.message, this.uid, required this.failed});

  factory RegResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RegResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegResponseEntityToJson(this);
}
