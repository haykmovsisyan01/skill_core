// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_out.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignOutEntity _$SignOutEntityFromJson(Map<String, dynamic> json) =>
    SignOutEntity(
      message: json['message'] as String,
      failed: json['failed'] as bool,
    );

Map<String, dynamic> _$SignOutEntityToJson(SignOutEntity instance) =>
    <String, dynamic>{'message': instance.message, 'failed': instance.failed};
