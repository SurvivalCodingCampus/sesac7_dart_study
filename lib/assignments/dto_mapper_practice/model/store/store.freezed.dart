// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Store {

 String get name; String get addr; double get lat; double get lng; StoreStatus get remainStat; String get code; DateTime get createdAt; DateTime get stockAt; String get type;
/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreCopyWith<Store> get copyWith => _$StoreCopyWithImpl<Store>(this as Store, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Store&&(identical(other.name, name) || other.name == name)&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,name,addr,lat,lng,remainStat,code,createdAt,stockAt,type);

@override
String toString() {
  return 'Store(name: $name, addr: $addr, lat: $lat, lng: $lng, remainStat: $remainStat, code: $code, createdAt: $createdAt, stockAt: $stockAt, type: $type)';
}


}

/// @nodoc
abstract mixin class $StoreCopyWith<$Res>  {
  factory $StoreCopyWith(Store value, $Res Function(Store) _then) = _$StoreCopyWithImpl;
@useResult
$Res call({
 String name, String addr, double lat, double lng, StoreStatus remainStat, String code, DateTime createdAt, DateTime stockAt, String type
});




}
/// @nodoc
class _$StoreCopyWithImpl<$Res>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._self, this._then);

  final Store _self;
  final $Res Function(Store) _then;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? addr = null,Object? lat = null,Object? lng = null,Object? remainStat = null,Object? code = null,Object? createdAt = null,Object? stockAt = null,Object? type = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addr: null == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,remainStat: null == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as StoreStatus,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,stockAt: null == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Store].
extension StorePatterns on Store {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Store value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Store() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Store value)  $default,){
final _that = this;
switch (_that) {
case _Store():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Store value)?  $default,){
final _that = this;
switch (_that) {
case _Store() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String addr,  double lat,  double lng,  StoreStatus remainStat,  String code,  DateTime createdAt,  DateTime stockAt,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Store() when $default != null:
return $default(_that.name,_that.addr,_that.lat,_that.lng,_that.remainStat,_that.code,_that.createdAt,_that.stockAt,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String addr,  double lat,  double lng,  StoreStatus remainStat,  String code,  DateTime createdAt,  DateTime stockAt,  String type)  $default,) {final _that = this;
switch (_that) {
case _Store():
return $default(_that.name,_that.addr,_that.lat,_that.lng,_that.remainStat,_that.code,_that.createdAt,_that.stockAt,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String addr,  double lat,  double lng,  StoreStatus remainStat,  String code,  DateTime createdAt,  DateTime stockAt,  String type)?  $default,) {final _that = this;
switch (_that) {
case _Store() when $default != null:
return $default(_that.name,_that.addr,_that.lat,_that.lng,_that.remainStat,_that.code,_that.createdAt,_that.stockAt,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _Store implements Store {
   _Store({required this.name, required this.addr, required this.lat, required this.lng, required this.remainStat, required this.code, required this.createdAt, required this.stockAt, required this.type});
  

@override final  String name;
@override final  String addr;
@override final  double lat;
@override final  double lng;
@override final  StoreStatus remainStat;
@override final  String code;
@override final  DateTime createdAt;
@override final  DateTime stockAt;
@override final  String type;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreCopyWith<_Store> get copyWith => __$StoreCopyWithImpl<_Store>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Store&&(identical(other.name, name) || other.name == name)&&(identical(other.addr, addr) || other.addr == addr)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.remainStat, remainStat) || other.remainStat == remainStat)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.stockAt, stockAt) || other.stockAt == stockAt)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,name,addr,lat,lng,remainStat,code,createdAt,stockAt,type);

@override
String toString() {
  return 'Store(name: $name, addr: $addr, lat: $lat, lng: $lng, remainStat: $remainStat, code: $code, createdAt: $createdAt, stockAt: $stockAt, type: $type)';
}


}

/// @nodoc
abstract mixin class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) _then) = __$StoreCopyWithImpl;
@override @useResult
$Res call({
 String name, String addr, double lat, double lng, StoreStatus remainStat, String code, DateTime createdAt, DateTime stockAt, String type
});




}
/// @nodoc
class __$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(this._self, this._then);

  final _Store _self;
  final $Res Function(_Store) _then;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? addr = null,Object? lat = null,Object? lng = null,Object? remainStat = null,Object? code = null,Object? createdAt = null,Object? stockAt = null,Object? type = null,}) {
  return _then(_Store(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addr: null == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,remainStat: null == remainStat ? _self.remainStat : remainStat // ignore: cast_nullable_to_non_nullable
as StoreStatus,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,stockAt: null == stockAt ? _self.stockAt : stockAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
