import 'package:modu_3_dart_study/assignments/data_source/user_model.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}
