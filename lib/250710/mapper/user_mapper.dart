import 'package:modu_3_dart_study/250710/dto/user_dto.dart';
import '../model/user.dart';

extension DtoToModel on UserDto {
  User toModel() {
    int userId = id == null
        ? throw FormatException("Json Parse Error")
        : id is num
        ? id!.toInt()
        : throw FormatException("Json Parse Error");
    String userName = name ?? '';

    return User(id: userId, name: userName);
  }
}

extension ModelToDto on User {
  UserDto toDto() {
    return UserDto(id: id, name: name);
  }
}
