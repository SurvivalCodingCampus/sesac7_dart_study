import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/20250703/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/20250703/model/user.dart';
import 'package:modu_3_dart_study/20250703/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final result = await _userDataSource.getAllData();
      return result
          .map((e) => User.fromJson(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    try {
      final result = await _userDataSource.getAllData();
      return result
          .map((e) => User.fromJson(e))
          .sortedBy((e) => e.name)
          .sublist(0, 10);
    } catch (e) {
      return [];
    }
  }
}
