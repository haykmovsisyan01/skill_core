// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FireStoreResponseEntity<T> {

 String? get message; String? get code; bool get failed; T? get data;
/// Create a copy of FireStoreResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FireStoreResponseEntityCopyWith<T, FireStoreResponseEntity<T>> get copyWith => _$FireStoreResponseEntityCopyWithImpl<T, FireStoreResponseEntity<T>>(this as FireStoreResponseEntity<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FireStoreResponseEntity<T>&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.failed, failed) || other.failed == failed)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,failed,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'FireStoreResponseEntity<$T>(message: $message, code: $code, failed: $failed, data: $data)';
}


}

/// @nodoc
abstract mixin class $FireStoreResponseEntityCopyWith<T,$Res>  {
  factory $FireStoreResponseEntityCopyWith(FireStoreResponseEntity<T> value, $Res Function(FireStoreResponseEntity<T>) _then) = _$FireStoreResponseEntityCopyWithImpl;
@useResult
$Res call({
 String? message, bool failed, String? code, T? data
});




}
/// @nodoc
class _$FireStoreResponseEntityCopyWithImpl<T,$Res>
    implements $FireStoreResponseEntityCopyWith<T, $Res> {
  _$FireStoreResponseEntityCopyWithImpl(this._self, this._then);

  final FireStoreResponseEntity<T> _self;
  final $Res Function(FireStoreResponseEntity<T>) _then;

/// Create a copy of FireStoreResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? failed = null,Object? code = freezed,Object? data = freezed,}) {
  return _then(FireStoreResponseEntity(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,failed: null == failed ? _self.failed : failed // ignore: cast_nullable_to_non_nullable
as bool,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [FireStoreResponseEntity].
extension FireStoreResponseEntityPatterns<T> on FireStoreResponseEntity<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
