class Geo {
  double lat;
  double lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  @override
  String toString() {
    return '$lat, $lng';
  }
}
