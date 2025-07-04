import 'package:modu_3_dart_study/assignments/2025-07-03/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();
  Future<List<User>> getUsersTop10ByUserName();
}
