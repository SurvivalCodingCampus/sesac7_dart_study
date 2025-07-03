import 'package:modu_3_dart_study/model/geo.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  @override
  String toString() {
    return '$street, $suite, $city, $zipcode, $geo';
  }
}
