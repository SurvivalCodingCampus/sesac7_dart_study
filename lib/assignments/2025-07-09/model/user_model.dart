import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@JsonSerializable()
class UserModel with _$UserModel {
  @override
  final int id;
  @override
  final String email;
  @override
  final String password;

  UserModel({required this.id, required this.email, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
