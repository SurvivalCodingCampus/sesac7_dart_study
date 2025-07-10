import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    required String addr,
    required String code,
    required String createdAt,
    required num lat,
    required num lng,
    required String name,
    required String remainStat,
    required String stockAt,
    required String type,
  }) = _Store;

  factory Store.fromJson(Map<String, Object?> json) => _$StoreFromJson(json);
}
