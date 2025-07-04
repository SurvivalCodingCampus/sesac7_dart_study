import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/250703/model/geo.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
