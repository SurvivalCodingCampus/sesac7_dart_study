import 'package:modu_3_dart_study/model_class_repository/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();

  Future<List<User>> getUsersTop10ByUserName();
}
