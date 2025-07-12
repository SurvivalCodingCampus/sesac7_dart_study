import '../dto/user_dto.dart';
import '../model/user.dart';

extension DtoToModel on UserDto {
  User toUser() {
    final int convertedId;
    final int convertedAge;

    if (id is int) {
      convertedId = id as int;
    } else {
      convertedId = -1;
    }

    if (age is int) {
      convertedAge = age as int;
    } else {
      convertedAge = -1;
    }

    return User(
      id: convertedId,
      name: name == '' ? 'unknown' : (name ?? 'unknown'),
      age: convertedAge,
      address: address == '' ? 'unknown' : (address ?? 'unknown'),
      phoneNumber: phoneNumber == '' ? 'unknown' : (phoneNumber ?? 'unknown'),
    );
  }
}
