import 'dart:async';

import 'package:modu_3_dart_study/18_result_pattern/core/network_error.dart';
import 'package:modu_3_dart_study/18_result_pattern/core/result.dart';
import 'package:modu_3_dart_study/18_result_pattern/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/18_result_pattern/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/18_result_pattern/model/user.dart';
import 'package:modu_3_dart_study/18_result_pattern/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, NetworkError>> getUser(int id) async {
    try {
      final user = (await _dataSource.getUsers()).body
          .where((e) => e.id == id)
          .map((e) => e.toModel())
          .toList()
          .first;
      return Result.success(user);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.notFound);
    }
  }

  @override
  Future<Result<List<User>, NetworkError>> getUsers() async {
    try {
      final response = await _dataSource.getUsers();
      final statusCode = response.statusCode;
      final users = response.body.map((e) => e.toModel()).toList();

      switch (statusCode) {
        case 401:
          return Result.error(NetworkError.unauthorized);
        case 404:
          return Result.error(NetworkError.notFound);
        case 504:
          throw TimeoutException('시간 초과');
      }
      return Result.success(users);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<String, NetworkError>> createUser(String name) async {
    try {
      final newId = (await _dataSource.getUsers()).body.length + 1;
      final user = User(id: newId, name: name);

      final response = await _dataSource.createUser(user);
      final statusCode = response.statusCode;

      switch (statusCode) {
        case 401:
          return Result.error(NetworkError.unauthorized);
        case 404:
          return Result.error(NetworkError.notFound);
        case 504:
          throw TimeoutException('시간 초과');
      }
      return Result.success('생성 성공 ${user.toString()}');
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
