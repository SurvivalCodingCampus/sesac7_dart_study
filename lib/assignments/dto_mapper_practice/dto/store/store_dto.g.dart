// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) => _StoreDto(
  addr: json['addr'] as String?,
  code: json['code'] as String?,
  createdAt: json['created_at'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  name: json['name'] as String?,
  remainStat: json['remain_stat'] as String?,
  stockAt: json['stock_at'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$StoreDtoToJson(_StoreDto instance) => <String, dynamic>{
  'addr': instance.addr,
  'code': instance.code,
  'created_at': instance.createdAt,
  'lat': instance.lat,
  'lng': instance.lng,
  'name': instance.name,
  'remain_stat': instance.remainStat,
  'stock_at': instance.stockAt,
  'type': instance.type,
};
