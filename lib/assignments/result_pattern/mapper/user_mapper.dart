import 'package:modu_3_dart_study/assignments/result_pattern/dto/user_dto.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/model/user.dart';

extension DtoToUserMapper on UserDto {
  User toModel() {
    return User(
      id: id?.toInt() ?? -1,
      name: name ?? 'empty user name',
      age: age?.toInt() ?? 0,
      address: address ?? 'empty address',
      phoneNumber: phoneNumber ?? 'empty phone number',
    );
  }
}
