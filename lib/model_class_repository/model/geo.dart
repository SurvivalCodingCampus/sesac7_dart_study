import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable(explicitToJson: true)
class Geo {
  final String lat;
  final String lng;

  // 생성자
  Geo({required this.lat, required this.lng});

  // copyWith
  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Geo &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          lng == other.lng;

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;

  @override
  String toString() {
    return '[lat: $lat, lng: $lng]';
  }

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}
