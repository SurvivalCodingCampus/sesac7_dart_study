// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoreDto {

 String? get addr; String? get code;@JsonKey(name: 'created_at') String? get createdAt; double? get lat; double? get lng; String? get name;@JsonKey(name: 'remain_stat') String? get remainStat;@JsonKey(name: 'stock_at') String? get stockAt; String? get type;
/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDtoCopyWith<StoreDto> get copyWith => _$StoreDtoCopyWithImpl<StoreDto>(this as StoreDto, _$identity);

  /// Serializes this StoreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDto&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addr,code,createdAt,lat,lng,name,remainStat,stockAt,type);

@override
String toString() {
  return 'StoreDto(addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type)';
}


}

/// @nodoc
abstract mixin class $StoreDtoCopyWith<$Res>  {
  factory $StoreDtoCopyWith(StoreDto value, $Res Function(StoreDto) _then) = _$StoreDtoCopyWithImpl;
@useResult
$Res call({
 String? addr, String? code,@JsonKey(name: 'created_at') String? createdAt, double? lat, double? lng, String? name,@JsonKey(name: 'remain_stat') String? remainStat,@JsonKey(name: 'stock_at') String? stockAt, String? type
});




}
/// @nodoc
class _$StoreDtoCopyWithImpl<$Res>
    implements $StoreDtoCopyWith<$Res> {
  _$StoreDtoCopyWithImpl(this._self, this._then);

  final StoreDto _self;
  final $Res Function(StoreDto) _then;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addr = freezed,Object? code = freezed,Object? createdAt = freezed,Object? lat = freezed,Object? lng = freezed,Object? name = freezed,Object? remainStat = freezed,Object? stockAt = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
addr: freezed == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,remainStat: freezed == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as String?,stockAt: freezed == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreDto].
extension StoreDtoPatterns on StoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreDto value)  $default,){
final _that = this;
switch (_that) {
case _StoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? addr,  String? code, @JsonKey(name: 'created_at')  String? createdAt,  double? lat,  double? lng,  String? name, @JsonKey(name: 'remain_stat')  String? remainStat, @JsonKey(name: 'stock_at')  String? stockAt,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
return $default(_that.addr,_that.code,_that.createdAt,_that.lat,_that.lng,_that.name,_that.remainStat,_that.stockAt,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? addr,  String? code, @JsonKey(name: 'created_at')  String? createdAt,  double? lat,  double? lng,  String? name, @JsonKey(name: 'remain_stat')  String? remainStat, @JsonKey(name: 'stock_at')  String? stockAt,  String? type)  $default,) {final _that = this;
switch (_that) {
case _StoreDto():
return $default(_that.addr,_that.code,_that.createdAt,_that.lat,_that.lng,_that.name,_that.remainStat,_that.stockAt,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? addr,  String? code, @JsonKey(name: 'created_at')  String? createdAt,  double? lat,  double? lng,  String? name, @JsonKey(name: 'remain_stat')  String? remainStat, @JsonKey(name: 'stock_at')  String? stockAt,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _StoreDto() when $default != null:
return $default(_that.addr,_that.code,_that.createdAt,_that.lat,_that.lng,_that.name,_that.remainStat,_that.stockAt,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreDto implements StoreDto {
   _StoreDto({this.addr, this.code, @JsonKey(name: 'created_at') this.createdAt, this.lat, this.lng, this.name, @JsonKey(name: 'remain_stat') this.remainStat, @JsonKey(name: 'stock_at') this.stockAt, this.type});
  factory _StoreDto.fromJson(Map<String, dynamic> json) => _$StoreDtoFromJson(json);

@override final  String? addr;
@override final  String? code;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override final  double? lat;
@override final  double? lng;
@override final  String? name;
@override@JsonKey(name: 'remain_stat') final  String? remainStat;
@override@JsonKey(name: 'stock_at') final  String? stockAt;
@override final  String? type;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreDtoCopyWith<_StoreDto> get copyWith => __$StoreDtoCopyWithImpl<_StoreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreDto&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addr,code,createdAt,lat,lng,name,remainStat,stockAt,type);

@override
String toString() {
  return 'StoreDto(addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type)';
}


}

/// @nodoc
abstract mixin class _$StoreDtoCopyWith<$Res> implements $StoreDtoCopyWith<$Res> {
  factory _$StoreDtoCopyWith(_StoreDto value, $Res Function(_StoreDto) _then) = __$StoreDtoCopyWithImpl;
@override @useResult
$Res call({
 String? addr, String? code,@JsonKey(name: 'created_at') String? createdAt, double? lat, double? lng, String? name,@JsonKey(name: 'remain_stat') String? remainStat,@JsonKey(name: 'stock_at') String? stockAt, String? type
});




}
/// @nodoc
class __$StoreDtoCopyWithImpl<$Res>
    implements _$StoreDtoCopyWith<$Res> {
  __$StoreDtoCopyWithImpl(this._self, this._then);

  final _StoreDto _self;
  final $Res Function(_StoreDto) _then;

/// Create a copy of StoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addr = freezed,Object? code = freezed,Object? createdAt = freezed,Object? lat = freezed,Object? lng = freezed,Object? name = freezed,Object? remainStat = freezed,Object? stockAt = freezed,Object? type = freezed,}) {
  return _then(_StoreDto(
addr: freezed == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,remainStat: freezed == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as String?,stockAt: freezed == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
