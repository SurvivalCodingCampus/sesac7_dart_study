import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/data_source/local/user_data_source.dart';
import 'package:modu_3_dart_study/model/user.dart';
import 'package:modu_3_dart_study/repository/user_repository.dart';


class UserRepositoryImpl implements UserRepository{

  final UserDataSource _dataSource;
  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<User>> getUsers(num id) async {
    try {
      final results = await _dataSource.getAll();
      return results
      .map((e) => User.fromJson(e))
      .where((user) => user.id == id)
      .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final results = await _dataSource.getAll();
    return results
    .map((e) => User.fromJson(e))
    .toList()
    .sorted((a, b) => a.username.compareTo(b.username))
    .sublist(0, 10);
  }
  
}