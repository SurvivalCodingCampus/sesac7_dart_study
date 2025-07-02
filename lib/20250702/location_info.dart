class LocationInfo {
  final String? lat;
  final String? lng;

  LocationInfo(this.lat, this.lng);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationInfo &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          lng == other.lng;

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;

  LocationInfo copyWith({
    String? lat,
    String? lng,
  }) {
    return LocationInfo(
      lat ?? this.lat,
      lng ?? this.lng,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory LocationInfo.fromJson(Map<String, dynamic> map) {
    return LocationInfo(
      map['lat'] as String,
      map['lng'] as String,
    );
  }

  @override
  String toString() {
    return 'LocationInfo{lat: $lat, lng: $lng}';
  }
}
