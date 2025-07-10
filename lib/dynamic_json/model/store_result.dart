import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/dynamic_json/model/store.dart';

part 'store_result.freezed.dart';
part 'store_result.g.dart';

@freezed
abstract class StoreResult with _$StoreResult {
  const factory StoreResult({
    required int count,
    required List<Store> stores,
  }) = _StoreResult;

  factory StoreResult.fromJson(Map<String, Object?> json) =>
      _$StoreResultFromJson(json);
}
