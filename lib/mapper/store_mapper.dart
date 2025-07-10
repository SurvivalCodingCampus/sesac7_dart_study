import 'package:intl/intl.dart';
import 'package:modu_3_dart_study/dto/store/store_dto.dart';
import 'package:modu_3_dart_study/model/store/store.dart';
import 'package:modu_3_dart_study/model/store/store_remain_status.dart';

extension StoreDtoToModelMapper on StoreDto {
  Store toModel() {
    return Store(
      address: addr ?? '',
      code: code ?? '',
      createdAt: _stringToDateTime(createdAt),
      lat: lat ?? 0,
      lng: lng ?? 0,
      name: name ?? '',
      remainStatus: _statusFromString(remainStat),
      stockAt: _stringToDateTime(stockAt),
      type: type ?? '',
    );
  }

  DateTime _stringToDateTime(String? value) {
    if (value == null || value == '') {
      return Store.unknownDate;
    }

    try {
      return DateFormat(Store.dateFormat).parse(value);
    } catch (e) {
      try {
        return DateTime.parse(value.replaceAll('/', '-'));
      } catch (e) {
        return Store.unknownDate;
      }
    }
  }

  StoreRemainStatus _statusFromString(String? value) {
    return switch (value) {
      'plenty' => StoreRemainStatus.plenty,
      'some' => StoreRemainStatus.some,
      'few' => StoreRemainStatus.few,
      'break' => StoreRemainStatus.breaked,
      'empty' => StoreRemainStatus.empty,
      _ => StoreRemainStatus.unknown,
    };
  }
}

extension StoreModelToDtoMapper on Store {
  StoreDto toDto() {
    return StoreDto(
      addr: address,
      code: code,
      createdAt: _formatDate(createdAt),
      lat: lat,
      lng: lng,
      name: name,
      remainStat: remainStatus.toString(),
      stockAt: _formatDate(stockAt),
      type: type,
    );
  }

  String _formatDate(DateTime value) {
    if (value == Store.unknownDate) {
      return '';
    }

    return DateFormat(Store.dateFormat).format(value);
  }
}
