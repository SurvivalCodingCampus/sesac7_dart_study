// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreResultDto _$StoreResultDtoFromJson(Map<String, dynamic> json) =>
    _StoreResultDto(
      count: (json['count'] as num?)?.toInt(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => StoreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreResultDtoToJson(_StoreResultDto instance) =>
    <String, dynamic>{'count': instance.count, 'stores': instance.stores};
