import 'package:modu_3_dart_study/core/exceptions.dart';

import '../dto/image_share_app_user/image_share_app_user_dto.dart';
import '../model/image_share_app_user.dart';

extension ImageShareAppUserDtoToModel on ImageShareAppUserDto {
  ImageShareAppUser toModel() {
    const String exceptionPrefix = 'ImageShareAppUserDtoToModel';
    final num? idPlaceHolder = id;
    final String? namePlaceHolder = name;
    final num? agePlaceHolder = age;
    final String? addressPlaceHolder = address;
    final String? phoneNumberPlaceHolder = phoneNumber;

    final int parseId;
    final String parseName;
    final int parseAge;
    final String parseAddress;
    final String parsePhoneNumber;

    if (idPlaceHolder == null) {
      throw JsonParsingException('$exceptionPrefix id field is null');
    } else {
      parseId = idPlaceHolder.toInt();
    }

    if (namePlaceHolder == null) {
      throw JsonParsingException('$exceptionPrefix name field is null');
    } else {
      parseName = namePlaceHolder;
    }

    if (agePlaceHolder == null) {
      throw JsonParsingException('$exceptionPrefix age field is null');
    } else {
      parseAge = agePlaceHolder.toInt();
    }

    if (addressPlaceHolder == null) {
      throw JsonParsingException('$exceptionPrefix address field is null');
    } else {
      parseAddress = addressPlaceHolder;
    }

    if (phoneNumberPlaceHolder == null) {
      throw JsonParsingException('$exceptionPrefix phoneNumber field is null');
    } else {
      parsePhoneNumber = phoneNumberPlaceHolder;
    }

    return ImageShareAppUser(
      id: parseId,
      name: parseName,
      age: parseAge,
      address: parseAddress,
      phoneNumber: parsePhoneNumber,
    );
  }
}

extension ImageShareAppUserModelToDto on ImageShareAppUser {
  ImageShareAppUserDto toDto() {
    return ImageShareAppUserDto(
      id: id,
      name: name,
      age: age,
      address: address,
      phoneNumber: phoneNumber,
    );
  }
}
