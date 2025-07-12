import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo.freezed.dart';

part 'geo.g.dart';

@freezed
abstract class Geo with _$Geo {
  const factory Geo({
    required String lat,
    required String lng,
  }) = _Geo;
  
  factory Geo.fromJson(Map<String, Object?> json) => _$GeoFromJson(json);
}
