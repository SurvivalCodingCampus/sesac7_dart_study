import '../../20250710/model/user.dart';
import '../core/network_error.dart';
import '../core/result.dart';

abstract interface class UserRepository {
  Future<Result<User, NetworkError>> getUser(int id);
  Future<Result<List<User>, NetworkError>> getUsers();
  Future<Result<User, NetworkError>> createUsers(Map<String, dynamic> json);
}