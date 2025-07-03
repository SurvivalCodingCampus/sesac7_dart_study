class Geo {
  final String? lat;
  final String? lon;

  Geo({this.lat, this.lon});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lon: json['lon'],
    );
  }

  @override
  String toString() => 'Geo(lat: $lat, lon: $lon)';

  @override
  int get hashCode => Object.hash(lat, lon);

  @override
  bool operator ==(Object other) =>
      other is Geo ? lat == other.lat && lon == other.lon : false;

  Geo copyWith({String? lat, String? lon}) =>
      Geo(lat: lat ?? this.lat, lon: lon ?? this.lon);

  Map<String, dynamic> toJson() => {'lat': lat, 'lon': lon};
}
