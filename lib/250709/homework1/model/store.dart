import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart'; //필요
part 'store.g.dart'; //필요

@freezed
@JsonSerializable()
class Store with _$Store {
  Store({
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

  @override
  final String addr;
  @override
  final String code;
  @override
  final DateTime createdAt;
  @override
  final num lat;
  @override
  final num lng;
  @override
  final String name;
  @override
  final String remainStat;
  @override
  final DateTime stockAt;
  @override
  final String type;

  factory Store.fromJson(Map<String, Object?> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
