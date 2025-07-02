import 'package:modu_3_dart_study/20250702/location_info.dart';

class AddressInfo {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final LocationInfo? geo;

  AddressInfo(this.street, this.suite, this.city, this.zipcode, this.geo);

  AddressInfo copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    LocationInfo? geo,
  }) {
    return AddressInfo(
      street ?? this.street,
      suite ?? this.suite,
      city ?? this.city,
      zipcode ?? this.zipcode,
      geo ?? this.geo,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressInfo &&
          runtimeType == other.runtimeType &&
          street == other.street &&
          suite == other.suite &&
          city == other.city &&
          zipcode == other.zipcode &&
          geo == other.geo;

  @override
  int get hashCode =>
      street.hashCode ^
      suite.hashCode ^
      city.hashCode ^
      zipcode.hashCode ^
      geo.hashCode;

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo,
    };
  }

  factory AddressInfo.fromJson(Map<String, dynamic> map) {
    return AddressInfo(
      map['street'] as String,
      map['suite'] as String,
      map['city'] as String,
      map['zipcode'] as String,
      LocationInfo.fromJson(map['geo']),
    );
  }

  @override
  String toString() {
    return 'AddressInfo{street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo}';
  }
}
