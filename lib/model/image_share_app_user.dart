import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_share_app_user.freezed.dart';

@freezed
class ImageShareAppUser with _$ImageShareAppUser {
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

  const ImageShareAppUser({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
    required this.phoneNumber,
  });
}
