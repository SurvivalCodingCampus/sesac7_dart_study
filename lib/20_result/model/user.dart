import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  @override
  final int id;
  @override
  final String name;
  @override
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });
}
