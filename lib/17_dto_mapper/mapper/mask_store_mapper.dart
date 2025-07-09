import 'package:modu_3_dart_study/17_dto_mapper/dto/store_dto.dart';

import '../model/store.dart';

extension DtoToStoreMapper on StoreDto {
  Store toModel() {
    return Store(
      addr: addr ?? 'null',
      code: code ?? 'null',
      createdAt: createdAt ?? 'null',
      lat: lat?.toDouble() ?? -1,
      lng: lng?.toDouble() ?? -1,
      name: name ?? 'null',
      remainStat: remainStat ?? 'null',
      stockAt: stockAt ?? 'null',
      type: type ?? 'null',
    );
  }
}

extension StoreToDtoMapper on Store {
  StoreDto toDto() {
    return StoreDto(
      addr: addr,
      code: code,
      createdAt: createdAt,
      lat: lat,
      lng: lng,
      name: name,
      remainStat: remainStat,
      stockAt: stockAt,
      type: type,
    );
  }
}
