import 'dart:convert';

import 'package:modu_3_dart_study/model/geo.dart';

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(jsonDecode(jsonEncode(json['geo']))),
    );
  }

  @override
  String toString() =>
      'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';

  @override
  int get hashCode => Object.hash(street, suite, city, zipcode, geo);

  @override
  bool operator ==(Object other) => other is Address
      ? street == other.street &&
            suite == other.suite &&
            city == other.city &&
            zipcode == other.zipcode &&
            geo == other.geo
      : false;

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) => Address(
    street: street ?? this.street,
    suite: suite ?? this.suite,
    city: city ?? this.city,
    zipcode: zipcode ?? this.zipcode,
    geo: geo ?? this.geo,
  );
}
