import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class Store with _$Store {
  final String addr;
  final int lat;
  final int lng;
  final String name;
  final String remain_stat;

  const Store({
    required this.addr,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remain_stat,
  });
}
