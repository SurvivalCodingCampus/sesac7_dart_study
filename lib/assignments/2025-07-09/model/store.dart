import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class Store with _$Store {
  @override
  final String addr;
  @override
  final String createdAt;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String name;
  @override
  final String remainStat;
  @override
  final String stockAt;

  Store({
    required this.addr,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
  });
}
