// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseEntity _$LoginResponseEntityFromJson(Map<String, dynamic> json) =>
    LoginResponseEntity(
      message: json['message'] as String,
      failed: json['failed'] as bool,
      token: json['token'] == null
          ? null
          : TokenEntity.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseEntityToJson(
  LoginResponseEntity instance,
) => <String, dynamic>{
  'message': instance.message,
  'failed': instance.failed,
  'token': instance.token,
};
