class Geo {
  String _lat;
  String _lng;

  // 생성자
  Geo({required String lat, required String lng})
    : _lat = lat.isEmpty ? 'undefined' : lat,
      _lng = lng.isEmpty ? 'undefined' : lng;

  // getter
  String get lat => _lat;

  String get lng => _lng;

  // setter
  set lat(String lat) {
    if (lat.isEmpty) {
      throw Exception('위도를 입력해야 합니다.');
    }
    _lat = lat;
  }

  set lng(String lng) {
    if (lng.isEmpty) {
      throw Exception('경도를 입력해야 합니다.');
    }
    _lng = lng;
  }

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  // 역직렬화(factory)
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'].isEmpty ? 'undefined' : json['lat'],
      lng: json['lng'].isEmpty ? 'undefined' : json['lng'],
    );
  }

  // 역직렬화
  Geo.fromJson2(Map<String, dynamic> json)
    : _lat = json['lat'].isEmpty ? 'undefined' : json['lat'],
      _lng = json['lng'].isEmpty ? 'undefined' : json['lng'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Geo &&
          runtimeType == other.runtimeType &&
          _lat == other._lat &&
          _lng == other._lng;

  @override
  int get hashCode => _lat.hashCode ^ _lng.hashCode;

  @override
  String toString() {
    return '[lat: $lat, lng: $lng]';
  }
}
