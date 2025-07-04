import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable(explicitToJson: true)
class Geo {
  final String? lat;
  final String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  @override
  int get hashCode => Object.hash(lat, lng);

  @override
  bool operator ==(Object other) =>
      other is Geo ? lat == other.lat && lng == other.lng : false;

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  Geo copyWith({String? lat, String? lng}) =>
      Geo(lat: lat ?? this.lat, lng: lng ?? this.lng);
}
