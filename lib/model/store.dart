import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class Store with _$Store {
  @override
  final String addr;
  @override
  final String code;
  @override
  final String createdAt;
  @override
  final num lat;
  @override
  final num lng;
  @override
  final String name;
  @override
  final String remainStat;
  @override
  final String stockAt;
  @override
  final String type;

  const Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });
}
