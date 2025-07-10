import 'package:modu_3_dart_study/assignments/2025-07-09/dto/store_data_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      addr: addr ?? '',
      createdAt: createdAt ?? '',
      lat: lat?.toDouble() ?? 0,
      lng: lng?.toDouble() ?? 0,
      name: name ?? '',
      remainStat: remainStat ?? '',
      stockAt: stockAt ?? '',
    );
  }
}
