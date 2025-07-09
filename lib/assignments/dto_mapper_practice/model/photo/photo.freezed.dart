// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Photo {

 int get id; PhotoType get type; DateTime get createdAt; String? get title; String? get content; String? get url; String? get caption;
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoCopyWith<Photo> get copyWith => _$PhotoCopyWithImpl<Photo>(this as Photo, _$identity);

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.url, url) || other.url == url)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,createdAt,title,content,url,caption);

@override
String toString() {
  return 'Photo(id: $id, type: $type, createdAt: $createdAt, title: $title, content: $content, url: $url, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $PhotoCopyWith<$Res>  {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) _then) = _$PhotoCopyWithImpl;
@useResult
$Res call({
 int id, PhotoType type, DateTime createdAt, String? title, String? content, String? url, String? caption
});




}
/// @nodoc
class _$PhotoCopyWithImpl<$Res>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._self, this._then);

  final Photo _self;
  final $Res Function(Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? createdAt = null,Object? title = freezed,Object? content = freezed,Object? url = freezed,Object? caption = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PhotoType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Photo].
extension PhotoPatterns on Photo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Photo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Photo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Photo value)  $default,){
final _that = this;
switch (_that) {
case _Photo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Photo value)?  $default,){
final _that = this;
switch (_that) {
case _Photo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  PhotoType type,  DateTime createdAt,  String? title,  String? content,  String? url,  String? caption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Photo() when $default != null:
return $default(_that.id,_that.type,_that.createdAt,_that.title,_that.content,_that.url,_that.caption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  PhotoType type,  DateTime createdAt,  String? title,  String? content,  String? url,  String? caption)  $default,) {final _that = this;
switch (_that) {
case _Photo():
return $default(_that.id,_that.type,_that.createdAt,_that.title,_that.content,_that.url,_that.caption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  PhotoType type,  DateTime createdAt,  String? title,  String? content,  String? url,  String? caption)?  $default,) {final _that = this;
switch (_that) {
case _Photo() when $default != null:
return $default(_that.id,_that.type,_that.createdAt,_that.title,_that.content,_that.url,_that.caption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Photo implements Photo {
  const _Photo({required this.id, required this.type, required this.createdAt, this.title, this.content, this.url, this.caption});
  factory _Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

@override final  int id;
@override final  PhotoType type;
@override final  DateTime createdAt;
@override final  String? title;
@override final  String? content;
@override final  String? url;
@override final  String? caption;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoCopyWith<_Photo> get copyWith => __$PhotoCopyWithImpl<_Photo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.url, url) || other.url == url)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,createdAt,title,content,url,caption);

@override
String toString() {
  return 'Photo(id: $id, type: $type, createdAt: $createdAt, title: $title, content: $content, url: $url, caption: $caption)';
}


}

/// @nodoc
abstract mixin class _$PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) _then) = __$PhotoCopyWithImpl;
@override @useResult
$Res call({
 int id, PhotoType type, DateTime createdAt, String? title, String? content, String? url, String? caption
});




}
/// @nodoc
class __$PhotoCopyWithImpl<$Res>
    implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(this._self, this._then);

  final _Photo _self;
  final $Res Function(_Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? createdAt = null,Object? title = freezed,Object? content = freezed,Object? url = freezed,Object? caption = freezed,}) {
  return _then(_Photo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PhotoType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
