// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Photo _$PhotoFromJson(Map<String, dynamic> json) => _Photo(
  id: (json['id'] as num).toInt(),
  type: $enumDecode(_$PhotoTypeEnumMap, json['type']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  title: json['title'] as String?,
  content: json['content'] as String?,
  url: json['url'] as String?,
  caption: json['caption'] as String?,
);

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$PhotoTypeEnumMap[instance.type]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'title': instance.title,
  'content': instance.content,
  'url': instance.url,
  'caption': instance.caption,
};

const _$PhotoTypeEnumMap = {
  PhotoType.article: 'article',
  PhotoType.image: 'image',
  PhotoType.video: 'video',
  PhotoType.invalid: 'invalid',
};
