import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';


part 'user.g.dart'; // 주의: 파일명에 따라 user 변수를 사용하세요.

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}