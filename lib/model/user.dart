import 'dart:convert';

import 'package:modu_3_dart_study/model/address.dart';
import 'package:modu_3_dart_study/model/company.dart';

class User {
  final num? id;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  User({
    this.id,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final int? id = json['id'];
    if (id is double) {
      id?.toInt();
    }
    final Address address = Address.fromJson(
      jsonDecode(jsonEncode(json['address'])),
    );
    final Company company = Company.fromJson(
      jsonDecode(jsonEncode(json['company'])),
    );
    return User(
      id: id,
      username: json['username'],
      email: json['email'],
      address: address,
      phone: json['phone'],
      website: json['website'],
      company: company,
    );
  }

  @override
  String toString() =>
      'User(id: $id, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';

  @override
  int get hashCode =>
      Object.hash(id, username, email, address, phone, website, company);

  @override
  bool operator ==(Object other) => other is User
      ? id == other.id &&
            username == other.username &&
            email == other.email &&
            address == other.address &&
            phone == other.phone &&
            website == other.website &&
            company == other.company
      : false;

  User copyWith({
    num? id,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) => User(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
    address: address ?? this.address,
    phone: phone ?? this.phone,
    website: website ?? this.website,
    company: company ?? this.company,
  );
}
