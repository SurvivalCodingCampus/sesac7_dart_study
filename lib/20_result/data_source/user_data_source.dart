import 'package:modu_3_dart_study/18_http/core/response.dart';

import '../dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<Response<UserDto>> getUser(int id);

  Future<Response<List<UserDto>>> getUsers();

  Future<Response<UserDto>> createUser(UserDto userDto);
}
