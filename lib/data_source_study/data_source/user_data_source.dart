import 'package:modu_3_dart_study/data_source_study/model/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}
