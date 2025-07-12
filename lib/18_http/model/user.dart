import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  @override
  final int id;
  @override
  final String name;
  @override
  final int age;
  @override
  final String address;
  @override
  final String phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
    required this.phoneNumber,
  });
}
