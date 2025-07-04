import 'dart:math';

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/model/user.dart';
import 'package:modu_3_dart_study/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl({required UserDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<User>> getUsers() async {
    try {
      return await _dataSource.getUsers();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    try {
      final users = await _dataSource.getUsers();
      return users
          .where((e) => e.username != null)
          .sortedBy<String>((e) => e.username!)
          .sublist(0, min(10, users.length));
    } catch (e) {
      return [];
    }
  }
}
