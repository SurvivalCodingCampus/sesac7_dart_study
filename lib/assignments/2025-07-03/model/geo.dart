// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable()
class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  Geo copyWith({String? lat, String? lng}) {
    return Geo(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  @override
  bool operator ==(covariant Geo other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';
}
