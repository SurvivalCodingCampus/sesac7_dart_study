import 'package:modu_3_dart_study/16_http/core/response.dart';
import 'package:modu_3_dart_study/18_result_pattern/model/user.dart';

import '../dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<Response<UserDto>> getUser(int id);

  Future<Response<List<UserDto>>> getUsers();

  Future<Response<void>> createUser(User user);
}
