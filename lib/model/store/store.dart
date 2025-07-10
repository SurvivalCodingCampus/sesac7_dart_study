import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/model/store/store_remain_status.dart';

part "store.freezed.dart";

@freezed
abstract class Store with _$Store {
  static final unknownDate = DateTime(0);
  static const dateFormat = 'yyyy/MM/dd HH:mm:ss';

  const factory Store({
    required String address,
    required String code,
    required DateTime createdAt,
    required double lat,
    required double lng,
    required String name,
    required StoreRemainStatus remainStatus,
    required DateTime stockAt,
    required String type,
  }) = _Store;
}
