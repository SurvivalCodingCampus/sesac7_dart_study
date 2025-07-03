import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable(explicitToJson: true)
class Geo {
  final String? lat;
  final String? lon;

  Geo({this.lat, this.lon});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  @override
  String toString() => 'Geo(lat: $lat, lon: $lon)';

  @override
  int get hashCode => Object.hash(lat, lon);

  @override
  bool operator ==(Object other) =>
      other is Geo ? lat == other.lat && lon == other.lon : false;

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  Geo copyWith({String? lat, String? lon}) =>
      Geo(lat: lat ?? this.lat, lon: lon ?? this.lon);
}
