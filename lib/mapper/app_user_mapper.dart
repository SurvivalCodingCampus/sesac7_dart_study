import 'package:modu_3_dart_study/model/app_user.dart';
import 'package:modu_3_dart_study/dto/app_user_dto.dart';

extension DtoToAppUserMapper on AppUserDto {
  AppUser toModel() {
    return AppUser(userId: userId ?? 0, id: id ?? 0, title: title ?? '');
  }
}

extension AppUserToDtoMapper on AppUser {
  AppUserDto toDto() {
    return AppUserDto(userId: userId, id: id, title: title);
  }
}
