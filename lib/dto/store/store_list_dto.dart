import 'store_dto.dart';

class StoreListDto {
  int? count;
  List<StoreDto>? stores;

  StoreListDto({this.count, this.stores});

  factory StoreListDto.fromJson(Map<String, dynamic> json) => StoreListDto(
    count: json['count'] as int?,
    stores: (json['stores'] as List<dynamic>?)
        ?.map((e) => StoreDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'count': count,
    'stores': stores?.map((e) => e.toJson()).toList(),
  };
}
