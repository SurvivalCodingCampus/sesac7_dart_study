import 'package:modu_3_dart_study/data_source/user/user_data_source.dart';
import 'package:modu_3_dart_study/model/user.dart';
import 'package:modu_3_dart_study/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl({required UserDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<User>> getUsers() async {
    return _dataSource.getUsers();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    return (await _dataSource.getUsers())
        .where((user) => user.id != null && user.id! <= 10)
        .toList();
  }
}
