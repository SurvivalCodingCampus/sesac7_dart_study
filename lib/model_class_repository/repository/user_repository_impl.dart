import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/model_class_repository/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/model/user.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  const UserRepositoryImpl({required UserDataSource userDataSource})
    : _userDataSource = userDataSource;

  @override
  Future<List<User>> getUsers() async {
    final result = await _userDataSource.getAll();

    return result.map((user) => User.fromJson(user)).toList();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final result = await _userDataSource.getAll();

    return result
        .map((user) => User.fromJson(user))
        .toList()
        .sortedBy((e) => e.name);
  }
}
