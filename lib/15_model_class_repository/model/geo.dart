import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable(explicitToJson: true)
class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  Geo copyWith(
    String lat,
    String lng,
  ) {
    return Geo(
      lat: lat,
      lng: lng,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is Geo) {
      return lat == other.lat && lng == other.lng;
    }
    return false;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;

  @override
  String toString() {
    return '{"lat": $lat, "lng": $lng}';
  }
}
