import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_dto.freezed.dart';
part 'store_dto.g.dart';

@freezed
abstract class StoreDto with _$StoreDto {
  factory StoreDto({
    String? addr,
    String? code,
    @JsonKey(name: 'created_at') String? createdAt,
    double? lat,
    double? lng,
    String? name,
    @JsonKey(name: 'remain_stat') String? remainStat,
    @JsonKey(name: 'stock_at') String? stockAt,
    String? type,
  }) = _StoreDto;

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);
}
