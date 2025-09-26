import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_response.freezed.dart';

@JsonSerializable()
@freezed
class FireStoreResponseEntity<T> with _$FireStoreResponseEntity<T> {
  final String? message;
  final String? code;
  final bool failed;
  final T? data;

  FireStoreResponseEntity({
    this.message,
    required this.failed,
    this.code,
    this.data,
  });

  FireStoreResponseEntity<R> copyWithType<R>({
    String? message,
    String? code,
    bool? failed,
    R? data,
  }) => FireStoreResponseEntity<R>(
    message: message ?? this.message,
    code: code ?? this.code,
    failed: failed ?? this.failed,
    data: data,
  );
}
