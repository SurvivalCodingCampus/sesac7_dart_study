import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    required addr,
    required code,
    required createdAt,
    required lat,
    required lng,
    required name,
    required remainStat,
    required stockAt,
    required type,
  }) = _Store;

  factory Store.fromJson(Map<String, Object?> json) => _$StoreFromJson(json);
}
