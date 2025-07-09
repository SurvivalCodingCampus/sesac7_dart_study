import 'package:modu_3_dart_study/assignments/2025-07-09/model/store.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/store_dto.dart';

class StoreMapperConstants {
  static const String nullPlaceholder = "null";
  static const double latGarbageValue = 100.0;
  static const double lngGarbageValue = 200.0;
  static const double minLatitude = -90.0;
  static const double maxLatitude = 90.0;
  static const double minLongitude = -180.0;
  static const double maxLongitude = 180.0;
}

extension DtoToStore on StoreDTO {
  Store toStore() {
    final addressHolder = (addr == null || addr == "")
        ? StoreMapperConstants.nullPlaceholder
        : addr!;
    final codeHolder = (code == null || code == "")
        ? StoreMapperConstants.nullPlaceholder
        : code!;
    final createdAtHolder = (createdAt == null || createdAt == "")
        ? StoreMapperConstants.nullPlaceholder
        : createdAt!;
    final latHolder =
        (lat == null ||
            lat! < StoreMapperConstants.minLatitude ||
            lat! > StoreMapperConstants.maxLatitude)
        ? StoreMapperConstants.latGarbageValue
        : lat!;
    final lngHolder =
        (lng == null ||
            lng! < StoreMapperConstants.minLongitude ||
            lng! > StoreMapperConstants.maxLongitude)
        ? StoreMapperConstants.lngGarbageValue
        : lng!;
    final nameHolder = (name == null || name == "")
        ? StoreMapperConstants.nullPlaceholder
        : name!;
    final remainStatHolder = (remainStat == null || remainStat == "")
        ? StoreMapperConstants.nullPlaceholder
        : remainStat!;
    final stockAtHolder = (stockAt == null || stockAt == "")
        ? StoreMapperConstants.nullPlaceholder
        : stockAt!;
    final typeHolder = (type == null || type == "")
        ? StoreMapperConstants.nullPlaceholder
        : type!;

    return Store(
      address: addressHolder,
      code: codeHolder,
      createdAt: createdAtHolder,
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
  StoreDTO toStoreDto() {
    return StoreDTO(
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
