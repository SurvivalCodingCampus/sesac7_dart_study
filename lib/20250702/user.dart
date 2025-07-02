import 'package:modu_3_dart_study/20250702/address_info.dart';
import 'package:modu_3_dart_study/20250702/company_info.dart';

class User {
  final num? id;
  final String? name;
  final String? username;
  final String? email;
  final AddressInfo? address;
  final String? phone;
  final String? website;
  final CompanyInfo? company;

  User(
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  );

  @override
  String toString() {
    return 'UserInfo{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company}';
  }

  User copyWith({
    num? id,
    String? name,
    String? username,
    String? email,
    AddressInfo? address,
    String? phone,
    String? website,
    CompanyInfo? company,
  }) {
    return User(
      id ?? this.id,
      name ?? this.name,
      username ?? this.username,
      email ?? this.email,
      address ?? this.address,
      phone ?? this.phone,
      website ?? this.website,
      company ?? this.company,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          email == other.email &&
          address == other.address &&
          phone == other.phone &&
          website == other.website &&
          company == other.company;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      website.hashCode ^
      company.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address,
      'phone': phone,
      'website': website,
      'company': company,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id'] as num,
      map['name'] as String,
      map['username'] as String,
      map['email'] as String,
      AddressInfo.fromJson(map['address']),
      map['phone'] as String,
      map['website'] as String,
      CompanyInfo.fromJson(map['company']),
    );
  }
}
