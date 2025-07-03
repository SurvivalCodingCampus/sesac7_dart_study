import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/model/geo.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

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

  Map<String, dynamic> toJson() => _$AddressToJson(this);

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
