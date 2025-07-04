import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final List<Map<String, dynamic>> listOfUserMap = await _dataSource
          .getAll();

      return listOfUserMap.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    try {
      final List<Map<String, dynamic>> listOfUserMap = await _dataSource
          .getAll();

      return listOfUserMap
          .map((e) => User.fromJson(e))
          .toList()
          .sortedBy((user) => user.username)
          .sublist(0, listOfUserMap.length < 10 ? listOfUserMap.length : 10);
    } catch (e) {
      return [];
    }
  }
}
