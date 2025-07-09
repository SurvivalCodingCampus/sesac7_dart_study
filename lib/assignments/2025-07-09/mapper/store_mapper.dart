import 'package:modu_3_dart_study/assignments/2025-07-09/model/store.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/store_dto.dart';

extension DtoToStore on Store_DTO {
  Store toStore() {
    final addressHolder = (addr == null || addr == "") ? "null" : addr!;
    final codeHolder = (code == null || code == "") ? "null" : code!;
    final created_atHolder = (createdAt == null || createdAt == "")
        ? "null"
        : createdAt!;
    final latHolder = (lat == null || lat! < -90.0 || lat! > 90.0)
        ? 100.0
        : lat!;
    final lngHolder = (lng == null || lng! < -180.0 || lng! > 180.0)
        ? 200.0
        : lng!;
    final nameHolder = (name == null || name == "") ? "null" : name!;
    final remainStatHolder = (remainStat == null || remainStat == "")
        ? "null"
        : remainStat!;
    final stockAtHolder = (stockAt == null || stockAt == "")
        ? "null"
        : stockAt!;
    final typeHolder = (type == null || type == "") ? "null" : type!;

    return Store(
      address: addressHolder,
      code: codeHolder,
      createdAt: created_atHolder,
      lat: latHolder,
      lng: lngHolder,
      name: nameHolder,
      remainStat: remainStatHolder,
      stockAt: stockAtHolder,
      type: typeHolder,
    );
  }
}

extension StoreToDto on Store {
  Store_DTO toStoreDto() {
    return Store_DTO(
      addr: address,
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
