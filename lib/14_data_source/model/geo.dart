class Geo {
  final String? lat;
  final String? lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: (json['lat'] is String) ? json['lat'] as String : null,
      lng: (json['lng'] is String) ? json['lng'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
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
