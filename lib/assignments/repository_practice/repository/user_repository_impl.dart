import 'package:modu_3_dart_study/assignments/repository_practice/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/model/user/user.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final users = (await _dataSource.getAll())
          .map((data) => User.fromJson(data))
          .toList();
      return users;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    try {
      final users = (await _dataSource.getAll())
          .map((data) => User.fromJson(data))
          .toList();

      users.sort((a, b) => a.username.compareTo(b.username));

      return users.sublist(0, (users.length < 10) ? users.length : 10);
    } catch (e) {
      return [];
    }
  }
}
