import 'package:modu_3_dart_study/model/address.dart';
import 'package:modu_3_dart_study/model/company.dart';

class User {
  final num? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address?.toJson(),
      'phone': phone,
      'website': website,
      'company': company?.toJson(),
    };
  }

  User copyWith({
    num? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  @override
  int get hashCode =>
      Object.hash(id, name, username, email, address, phone, website, company);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is User &&
            id == other.id &&
            name == other.name &&
            username == other.username &&
            email == other.email &&
            address == other.address &&
            phone == other.phone &&
            website == other.website &&
            company == other.company;
  }
}
