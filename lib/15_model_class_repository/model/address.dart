import 'package:json_annotation/json_annotation.dart';

import 'geo.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Address copyWith(
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  ) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo != null
          ? geo.copyWith(geo.lat, geo.lng)
          : this.geo.copyWith(this.geo.lat, this.geo.lng),
    );
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
