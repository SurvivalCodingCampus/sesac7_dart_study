import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/15_model_class_repository/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/model/user.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final users = (await _dataSource.getAll())
          .map((e) => User.fromJson(e))
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
          .map((e) => User.fromJson(e))
          .sortedBy((e) => e.userName)
          .toList();
      return users.sublist(0, (users.length < 10) ? users.length : 10);
    } catch (e) {
      return [];
    }
  }
}
