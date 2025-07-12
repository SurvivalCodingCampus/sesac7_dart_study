import 'package:freezed_annotation/freezed_annotation.dart';

part "user2.freezed.dart";

@freezed
abstract class User2 with _$User2 {
  static const invalidId = -1;

  const factory User2({
    required int id,
    required String name,
    required int age,
    required String address,
    required String phoneNumber,
  }) = _User2;
}
