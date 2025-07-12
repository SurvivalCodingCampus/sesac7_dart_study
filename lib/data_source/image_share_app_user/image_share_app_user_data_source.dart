import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/dto/image_share_app_user/image_share_app_user_dto.dart';

abstract interface class ImageShareAppUserDataSource {
  Future<Response<List<ImageShareAppUserDto>>> getImageShareAppUsers();
  Future<Response<ImageShareAppUserDto>> getImageShareAppUserFindById(int id);
  Future<Response<ImageShareAppUserDto>> createImageShareAppUser(ImageShareAppUserDto dto);
}