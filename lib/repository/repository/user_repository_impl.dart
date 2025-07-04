import 'package:modu_3_dart_study/repository/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/repository/model/user.dart';
import 'package:modu_3_dart_study/repository/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final results = await _userDataSource.getUsers();
      return results.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    try {
      final results = await _userDataSource.getUsersTop10ByUserName();
      return results.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
