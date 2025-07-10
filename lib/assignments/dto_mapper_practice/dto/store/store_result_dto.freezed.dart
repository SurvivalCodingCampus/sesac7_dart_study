// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoreResultDto {

 int? get count; List<StoreDto>? get stores;
/// Create a copy of StoreResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreResultDtoCopyWith<StoreResultDto> get copyWith => _$StoreResultDtoCopyWithImpl<StoreResultDto>(this as StoreResultDto, _$identity);

  /// Serializes this StoreResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreResultDto&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.stores, stores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,const DeepCollectionEquality().hash(stores));

@override
String toString() {
  return 'StoreResultDto(count: $count, stores: $stores)';
}


}

/// @nodoc
abstract mixin class $StoreResultDtoCopyWith<$Res>  {
  factory $StoreResultDtoCopyWith(StoreResultDto value, $Res Function(StoreResultDto) _then) = _$StoreResultDtoCopyWithImpl;
@useResult
$Res call({
 int? count, List<StoreDto>? stores
});




}
/// @nodoc
class _$StoreResultDtoCopyWithImpl<$Res>
    implements $StoreResultDtoCopyWith<$Res> {
  _$StoreResultDtoCopyWithImpl(this._self, this._then);

  final StoreResultDto _self;
  final $Res Function(StoreResultDto) _then;

/// Create a copy of StoreResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = freezed,Object? stores = freezed,}) {
  return _then(_self.copyWith(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,stores: freezed == stores ? _self.stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreResultDto].
extension StoreResultDtoPatterns on StoreResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreResultDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreResultDto value)  $default,){
final _that = this;
switch (_that) {
case _StoreResultDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _StoreResultDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? count,  List<StoreDto>? stores)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreResultDto() when $default != null:
return $default(_that.count,_that.stores);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? count,  List<StoreDto>? stores)  $default,) {final _that = this;
switch (_that) {
case _StoreResultDto():
return $default(_that.count,_that.stores);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? count,  List<StoreDto>? stores)?  $default,) {final _that = this;
switch (_that) {
case _StoreResultDto() when $default != null:
return $default(_that.count,_that.stores);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreResultDto implements StoreResultDto {
  const _StoreResultDto({this.count, final  List<StoreDto>? stores}): _stores = stores;
  factory _StoreResultDto.fromJson(Map<String, dynamic> json) => _$StoreResultDtoFromJson(json);

@override final  int? count;
 final  List<StoreDto>? _stores;
@override List<StoreDto>? get stores {
  final value = _stores;
  if (value == null) return null;
  if (_stores is EqualUnmodifiableListView) return _stores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of StoreResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreResultDtoCopyWith<_StoreResultDto> get copyWith => __$StoreResultDtoCopyWithImpl<_StoreResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreResultDto&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._stores, _stores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,const DeepCollectionEquality().hash(_stores));

@override
String toString() {
  return 'StoreResultDto(count: $count, stores: $stores)';
}


}

/// @nodoc
abstract mixin class _$StoreResultDtoCopyWith<$Res> implements $StoreResultDtoCopyWith<$Res> {
  factory _$StoreResultDtoCopyWith(_StoreResultDto value, $Res Function(_StoreResultDto) _then) = __$StoreResultDtoCopyWithImpl;
@override @useResult
$Res call({
 int? count, List<StoreDto>? stores
});




}
/// @nodoc
class __$StoreResultDtoCopyWithImpl<$Res>
    implements _$StoreResultDtoCopyWith<$Res> {
  __$StoreResultDtoCopyWithImpl(this._self, this._then);

  final _StoreResultDto _self;
  final $Res Function(_StoreResultDto) _then;

/// Create a copy of StoreResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = freezed,Object? stores = freezed,}) {
  return _then(_StoreResultDto(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,stores: freezed == stores ? _self._stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreDto>?,
  ));
}


}

// dart format on
