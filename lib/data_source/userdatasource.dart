import '../model/User.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}