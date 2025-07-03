import 'package:modu_3_dart_study/assignments/repository_practice/model/user/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();

  Future<List<User>> getUsersTop10ByUserName();
}
