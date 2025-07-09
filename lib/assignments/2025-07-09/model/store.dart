import 'package:freezed_annotation/freezed_annotation.dart';
part 'store.freezed.dart';

@freezed
class Store with _$Store {
  @override
  final String address;
  @override
  final String code;
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
  @override
  final String type;

  const Store({
    required this.address,
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
