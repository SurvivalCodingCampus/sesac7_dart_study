import 'package:modu_3_dart_study/assignments/http_practice/core/response.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<Response<UserDto>> getUserId(int id);

  Future<Response<List<UserDto>>> getUsers();

  Future<Response<UserDto>> createUser(UserDto dto);
}
