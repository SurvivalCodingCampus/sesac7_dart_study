import 'package:modu_3_dart_study/250709/homework1/dto/store_dto.dart';
import 'package:modu_3_dart_study/250709/homework1/model/store.dart';

final DateTime DATE_NOT_AVAILABLE = DateTime.fromMillisecondsSinceEpoch(0);
const double DEFAULT_LATITUDE = 37.5665;
const double DEFAULT_LONGITUDE = 126.9780;

extension DtoToModel on StoreDto {
  Store toModel() {
    return Store(
      addr: addr ?? '',
      code: code ?? '',
      createdAt: createdAt == null
          ? DATE_NOT_AVAILABLE
          : (DateTime.tryParse((createdAt as String).replaceAll('/', '-')) ??
                DATE_NOT_AVAILABLE),
      lat: lat == null ? DEFAULT_LATITUDE : (lat as num).toDouble(),
      lng: lng == null ? DEFAULT_LONGITUDE : (lng as num).toDouble(),
      name: name ?? '',
      remainStat: remainStat ?? '',
      stockAt: stockAt == null
          ? DATE_NOT_AVAILABLE
          : DateTime.tryParse((stockAt as String).replaceAll('/', '-')) ??
                DATE_NOT_AVAILABLE,
      type: type ?? '',
    );
  }
}

extension ModelToDto on Store {
  StoreDto toModel() {
    return StoreDto(
      addr: addr == '' ? null : addr,
      code: code == '' ? null : code,
      createdAt: createdAt == DATE_NOT_AVAILABLE
          ? null
          : createdAt.toString().replaceAll('-', '/'),
      lat: lat == DEFAULT_LATITUDE ? null : lat,
      lng: lng == DEFAULT_LONGITUDE ? null : lng,
      name: name == '' ? null : name,
      remainStat: remainStat == '' ? null : remainStat,
      stockAt: stockAt == DATE_NOT_AVAILABLE
          ? null
          : stockAt.toString().replaceAll('-', '/'),
      type: type == '' ? null : type,
    );
  }
}
