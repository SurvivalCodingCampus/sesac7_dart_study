import 'package:modu_3_dart_study/dto/mask_stock_dto.dart';
import 'package:modu_3_dart_study/model/store.dart';

extension StoreDtoToModel on StoreDto {
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

extension StoreModelToDto on Store {
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
