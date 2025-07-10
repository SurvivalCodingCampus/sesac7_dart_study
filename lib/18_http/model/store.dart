import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class Store with _$Store {
  @override
  final String addr;
  @override
  final int lat;
  @override
  final int lng;
  @override
  final String name;
  @override
  final String remain_stat;

  const Store({
    required this.addr,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remain_stat,
  });
}
