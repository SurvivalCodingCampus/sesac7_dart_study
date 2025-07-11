import 'package:modu_3_dart_study/20_result/dto/user_dto.dart';

import '../model/user.dart';

extension UserDtoToModer on UserDto {
  User toModel() {
    return User(
      id: id!.toInt(),
      name: name ?? '이름 없음',
      email: email ?? '메일 없음',
    );
  }
}
