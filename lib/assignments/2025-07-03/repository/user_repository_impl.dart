import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/assignments/2025-07-02/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-02/models/user.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final userMapList = await _userDataSource.getUsers();
      return userMapList.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    try {
      final List<Map<String, dynamic>> userMapList = await _userDataSource
          .getUsers();
      final List<User> users = userMapList
          .map((e) => User.fromJson(e))
          .toList();
      return users.sortedBy((user) => user.name).sublist(0, 10);
    } catch (e) {
      return [];
    }
  }
}
