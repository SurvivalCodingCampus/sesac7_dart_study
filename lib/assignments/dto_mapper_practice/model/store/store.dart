import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

enum StoreStatus {
  plenty('plenty'),
  some('some'),
  few('few'),
  empty('empty'),
  break_('break');

  final String value;

  const StoreStatus(this.value);
}

@freezed
abstract class Store with _$Store {
  factory Store({
    required String name,
    required String addr,
    required double lat,
    required double lng,
    required StoreStatus remainStat,
    required String code,
    required DateTime createdAt,
    required DateTime stockAt,
    required String type,
  }) = _Store;
}
