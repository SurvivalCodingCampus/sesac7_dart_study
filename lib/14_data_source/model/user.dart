import 'address.dart';
import 'company.dart';

class User {
  final num? id;
  final String? name;
  final String? userName;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: (json['id'] is num) ? json['id'] as num : null,
      name: (json['name'] is String) ? json['name'] as String : null,
      userName: (json['username'] is String)
          ? json['username'] as String
          : null,
      email: (json['email'] is String) ? json['email'] as String : null,
      address: (json['address'] is Map)
          ? Address.fromJson(json['address'])
          : null,
      phone: (json['phone'] is String) ? json['phone'] as String : null,
      website: (json['website'] is String) ? json['website'] as String : null,
      company: (json['company'] is Map)
          ? Company.fromJson(json['company'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': userName,
      'email': email,
      'address': address?.toJson(),
      'phone': phone,
      'website': website,
      'company': company?.toJson(),
    };
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
