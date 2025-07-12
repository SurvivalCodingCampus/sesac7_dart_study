import 'package:modu_3_dart_study/18_result_pattern/core/network_error.dart';
import 'package:modu_3_dart_study/18_result_pattern/core/result.dart';

import '../model/user.dart';

abstract interface class UserRepository {
  Future<Result<User, NetworkError>> getUser(int id);

  Future<Result<List<User>, NetworkError>> getUsers();

  Future<Result<String, NetworkError>> createUser(String name);
}
