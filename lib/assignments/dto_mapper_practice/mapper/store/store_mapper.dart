import 'package:intl/intl.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/dto/store/store_dto.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/store/store.dart';

extension ToStore on StoreDto {
  Store toStore() {
    return Store(
      name: name ?? 'default name',
      addr: addr ?? 'default addr',
      lat: lat ?? 0.0,
      lng: lng ?? 0.0,
      remainStat: StoreStatus.values.firstWhere((e) => e.value == remainStat!),
      code: code ?? 'default code',
      createdAt: DateFormat('yyyy/MM/dd HH:mm:ss').parse(createdAt!),
      stockAt: DateFormat('yyyy/MM/dd HH:mm:ss').parse(stockAt!),
      type: type ?? 'default type',
    );
  }
}

extension ToDto on Store {
  StoreDto toDto() {
    return StoreDto(
      name: name,
      addr: addr,
      lat: lat,
      lng: lng,
      remainStat: remainStat.value,
      code: code,
      createdAt: DateFormat('yyyy/MM/dd HH:mm:ss').format(createdAt),
      stockAt: DateFormat('yyyy/MM/dd HH:mm:ss').format(stockAt),
      type: type,
    );
  }
}
