import 'package:modu_3_dart_study/assignments/result_pattern/core/network_error.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/core/result.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/dto/user_dto.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/model/user.dart';

abstract interface class UserRepository {
  Future<Result<List<User>, NetworkError>> getUsers();

  Future<Result<User, NetworkError>> getUserId(int id);

  Future<Result<String, NetworkError>> createUser(UserDto dto);
}
