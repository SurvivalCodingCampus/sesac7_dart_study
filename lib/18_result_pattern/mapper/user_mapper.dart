import '../dto/user_dto.dart';
import '../model/user.dart';

extension DtoToUserMapper on UserDto {
  User toModel() {
    return User(
      id: id?.toInt() ?? -1,
      name: name ?? '',
    );
  }
}
