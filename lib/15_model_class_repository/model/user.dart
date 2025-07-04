import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith(
    int id,
    String name,
    String userName,
    String email,
    Address address,
    String phone,
    String website,
    Company company,
  ) {
    return User(
      id: this.id,
      name: this.name,
      userName: this.userName,
      email: this.email,
      address: this.address.copyWith(
        this.address.street,
        this.address.suite,
        this.address.city,
        this.address.zipcode,
        this.address.geo,
      ),
      phone: this.phone,
      website: this.website,
      company: this.company.copyWith(
        this.company.name,
        this.company.catchPhrase,
        this.company.bs,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is User) {
      return id == other.id &&
          name == other.name &&
          userName == other.userName &&
          email == other.email &&
          address == other.address &&
          phone == other.phone &&
          website == other.website &&
          company == other.company;
    }
    return false;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      userName.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      website.hashCode ^
      company.hashCode;

  @override
  String toString() {
    return '{"id": $id, "name": $name, "username": $userName, "email": $email, "address": $address, "phone": $phone, "website": $website, "company": $company}';
  }
}
