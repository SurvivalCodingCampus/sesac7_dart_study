import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/dynamic_json/dto/store_result_dto.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    required int count,
    required List<StoreDto> stores,
  }) = _Store;

  factory Store.fromJson(Map<String, Object?> json) => _$StoreFromJson(json);
}
