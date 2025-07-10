import 'package:modu_3_dart_study/model/store.dart';
import 'package:modu_3_dart_study/dto/store_dto.dart';

extension DtoToStoreMapper on StoreDto {
  Store toModel() {
    return Store(
      addr: addr ?? '',
      code: code ?? '',
      createdAt: createdAt ?? '',
      lat: lat ?? 0.0,
      lng: lng ?? 0.0,
      name: name ?? '',
      remainStat: remainStat ?? '',
      stockAt: stockAt ?? '',
      type: type ?? '',
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
