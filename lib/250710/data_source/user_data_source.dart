import '../core/response.dart';
import '../dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<Response<List<UserDto>>> getUsers();

  Future<Response<UserDto>> getUser({required int id});

  Future<Response<UserDto>> addUser({required UserDto userDto});
}
