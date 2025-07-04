import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart'; // 주의: 파일명에 따라 geo 변수를 사용하세요.

@JsonSerializable(explicitToJson: true)
class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}
