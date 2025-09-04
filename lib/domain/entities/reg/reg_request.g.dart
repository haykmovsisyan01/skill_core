// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegRequestEntity _$RegRequestEntityFromJson(Map<String, dynamic> json) =>
    RegRequestEntity(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegRequestEntityToJson(RegRequestEntity instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
