import '../models/user.dart';

abstract interface class UserDataSource {
  Future<User> getUser();

  Future<List<Map<String, dynamic>>> getUsers();
}
