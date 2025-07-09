import 'package:modu_3_dart_study/20250709/dto/mask_store_dto.dart';
import 'package:modu_3_dart_study/20250709/model/mask_store.dart';
import 'package:modu_3_dart_study/20250709/model/store.dart';

extension StoreMapper on StoreDTO {
  Store toStore() {
    return Store(
      addr: addr ?? '',
      code: code ?? '',
      createdAt: createdAt ?? '',
      lat: lat ?? 0,
      lng: lng ?? 0,
      name: name ?? '',
      remainStat: remainStat ?? '',
      stockAt: stockAt ?? '',
      type: type ?? '',
    );
  }
}

extension MaskStoreMapper on MaskStoreDto {
  MaskStore toMaskStore() {
    return MaskStore(count: count ?? 0, stores: stores ?? []);
  }
}
