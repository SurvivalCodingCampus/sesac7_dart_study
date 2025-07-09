import 'package:modu_3_dart_study/17_dto_mapper/dto/store_dto.dart';

class MaskStoreDto {
  MaskStoreDto({
    this.count,
    this.stores,
  });

  MaskStoreDto.fromJson(dynamic json) {
    count = json['count'];
    if (json['stores'] != null) {
      stores = [];
      json['stores'].forEach((v) {
        stores?.add(StoreDto.fromJson(v));
      });
    }
  }

  num? count;
  List<StoreDto?>? stores;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (stores != null) {
      map['stores'] = stores?.map((v) => v?.toJson()).toList();
    }
    return map;
  }
}
