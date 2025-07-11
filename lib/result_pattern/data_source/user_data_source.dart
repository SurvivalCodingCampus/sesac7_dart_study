import '../core/reponse.dart';
import '../dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<Response<List<UserDto>>> getUsers();

  Future<Response<UserDto>> getUser(int id);

  Future<Response<UserDto>> createUser(Map<String, dynamic> user);
}
