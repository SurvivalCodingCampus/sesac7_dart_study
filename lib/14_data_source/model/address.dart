import 'geo.dart';

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: (json['street'] is String) ? json['street'] as String : null,
      suite: (json['suite'] is String) ? json['suite'] as String : null,
      city: (json['city'] is String) ? json['city'] as String : null,
      zipcode: (json['zipcode'] is String) ? json['zipcode'] as String : null,
      geo: (json['geo'] is Map) ? Geo.fromJson(json['geo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is Address) {
      return street == other.street &&
          suite == other.suite &&
          city == other.city &&
          zipcode == other.zipcode &&
          geo == other.geo;
    }
    return false;
  }

  @override
  int get hashCode =>
      street.hashCode ^
      suite.hashCode ^
      city.hashCode ^
      zipcode.hashCode ^
      geo.hashCode;

  @override
  String toString() {
    return '{"street": $street, "suite": $suite, "city": $city, "zipcode": $zipcode, "geo": $geo}';
  }
}
