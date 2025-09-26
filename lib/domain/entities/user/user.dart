import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
@JsonSerializable()
class UserEntity with _$UserEntity {
  final String? name;
  final String? surname;
  final String? email;
  final String? uid;
  final DateTime? createdDate;

  UserEntity({this.name, this.surname, this.email, this.uid, this.createdDate});

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  Map<String, dynamic> toJsonWithoutNull() {
    final Map<String, dynamic> newMap = <String, dynamic>{};
    toJson().forEach((key, value) {
      if (value != null) {
        newMap[key] = value;
      }
    });
    return newMap;
  }
}
