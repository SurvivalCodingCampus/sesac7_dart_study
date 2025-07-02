import 'package:modu_3_dart_study/20250702/user.dart';

abstract interface class UserDataSource {
  Future<List<User?>> getUsers(String filePath);
}