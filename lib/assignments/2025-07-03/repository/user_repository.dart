import 'package:modu_3_dart_study/assignments/2025-07-02/models/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();

  Future<List<User>> getUsersTop5ByUserName();
}
