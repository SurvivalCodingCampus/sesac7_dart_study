import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/250703/model/address.dart';
import 'package:modu_3_dart_study/250703/model/company.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return '$name';
  }
}
