import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/250703/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/250703/model/user.dart';
import 'package:modu_3_dart_study/250703/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    final list = await _userDataSource.getUsers();
    return list.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final list = await _userDataSource.getUsers();
    return list
        .map((e) => User.fromJson(e))
        .toList()
        .sortedBy(
          (e) => (e.name == null || e.name!.isEmpty) ? 'zzzzz' : e.name!,
        )
        .take(10)
        .toList();
  }
}
