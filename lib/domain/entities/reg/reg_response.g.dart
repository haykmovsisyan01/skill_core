// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegResponseEntity _$RegResponseEntityFromJson(Map<String, dynamic> json) =>
    RegResponseEntity(
      message: json['message'] as String,
      uid: json['uid'] as String?,
      failed: json['failed'] as bool,
    );

Map<String, dynamic> _$RegResponseEntityToJson(RegResponseEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'uid': instance.uid,
      'failed': instance.failed,
    };
