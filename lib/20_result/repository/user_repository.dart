import 'package:modu_3_dart_study/20_result/core/network_error.dart';
import 'package:modu_3_dart_study/20_result/core/result.dart';
import 'package:modu_3_dart_study/20_result/model/user.dart';

abstract interface class UserRepository {
  Future<Result<User, NetworkError>> getUser(int id);

  Future<Result<List<User>, NetworkError>> getUsers();

  Future<Result<User, NetworkError>> createUser(
    String name,
    String email,
  );
}
