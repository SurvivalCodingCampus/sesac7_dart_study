import 'package:modu_3_dart_study/core/response.dart';
import '../../dto/app_user_dto.dart';

abstract interface class AppUserDataSource {
  Future<Response<AppUserDto>> getUser(int userId);

  Future<Response<List<AppUserDto>>> getUserList();

  Future<Response<AppUserDto>> createUser(AppUserDto dto);
}
