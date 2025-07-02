import 'package:modu_3_dart_study/data_source_study/model/geo.dart';

class Address {
  String _street;
  String _suite;
  String _city;
  String _zipcode;
  Geo _geo;

  // 생성자
  Address({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required Geo geo,
  }) : _street = street.isEmpty ? 'undefined' : street,
       _suite = suite.isEmpty ? 'undefined' : suite,
       _city = city.isEmpty ? 'undefined' : city,
       _zipcode = zipcode.isEmpty ? 'undefined' : zipcode,
       _geo = geo;

  // getter
  String get street => _street;

  String get suite => _suite;

  String get city => _city;

  String get zipcode => _zipcode;

  Geo get geo => _geo;

  // setter
  set street(String street) {
    if (street.isEmpty) {
      throw Exception('거리 이름을 입력해야 합니다.');
    }
    _street = street;
  }

  set suite(String suite) {
    if (suite.isEmpty) {
      throw Exception('객실을 입력해야 합니다.');
    }
    _suite = suite;
  }

  set city(String city) {
    if (city.isEmpty) {
      throw Exception('도시 이름을 입력해야 합니다.');
    }
    _city = city;
  }

  set zipcode(String zipcode) {
    if (zipcode.isEmpty) {
      throw Exception('우편 번호를 입력해야 합니다.');
    }
    _zipcode = zipcode;
  }

  set geo(Geo geo) => _geo = geo;

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'street': street.isEmpty ? 'undefined' : street,
      'suite': suite.isEmpty ? 'undefined' : suite,
      'city': city.isEmpty ? 'undefined' : city,
      'zipcode': zipcode.isEmpty ? 'undefined' : zipcode,
      'geo': geo.toJson().isEmpty ? 'undefined' : geo.toJson(),
    };
  }

  // 역직렬화(factory)
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'].isEmpty ? 'undefined' : json['street'],
      suite: json['suite'].isEmpty ? 'undefined' : json['suite'],
      city: json['city'].isEmpty ? 'undefined' : json['city'],
      zipcode: json['zipcode'].isEmpty ? 'undefined' : json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }

  // 역직렬화
  Address.fromJson2(Map<String, dynamic> json)
    : _street = json['street'].isEmpty ? 'undefined' : json['street'],
      _suite = json['suite'].isEmpty ? 'undefined' : json['suite'],
      _city = json['city'].isEmpty ? 'undefined' : json['city'],
      _zipcode = json['zipcode'].isEmpty ? 'undefined' : json['zipcode'],
      _geo = Geo.fromJson(json['geo']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          _street == other._street &&
          _suite == other._suite &&
          _city == other._city &&
          _zipcode == other._zipcode &&
          _geo == other._geo;

  @override
  int get hashCode =>
      _street.hashCode ^
      _suite.hashCode ^
      _city.hashCode ^
      _zipcode.hashCode ^
      _geo.hashCode;

  @override
  String toString() {
    return '[street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: ${geo.toString()}]';
  }
}
