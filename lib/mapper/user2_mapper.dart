import 'package:modu_3_dart_study/dto/user2/user2_dto.dart';
import 'package:modu_3_dart_study/model/user2/user2.dart';

extension User2DtoToModel on User2Dto {
  User2 toModel() {
    return User2(
      id: id ?? User2.invalidId,
      name: name ?? '',
      age: age ?? 0,
      address: address ?? '',
      phoneNumber: phoneNumber ?? '',
    );
  }
}

extension User2ModelToDto on User2 {
  User2Dto toDto() {
    return User2Dto(
      id: id,
      name: name,
      age: age,
      address: address,
      phoneNumber: phoneNumber,
    );
  }
}
