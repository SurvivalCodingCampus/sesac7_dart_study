import 'package:modu_3_dart_study/result_pattern/core/network_error.dart';

import '../core/result.dart';
import '../model/user.dart';

abstract interface class UserRepository {
  Future<Result<User, NetworkError>> getUserById(int id);

  Future<Result<List<User>, NetworkError>> getAllUsers();
}
