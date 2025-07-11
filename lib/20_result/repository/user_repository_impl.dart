import 'dart:async';

import 'package:modu_3_dart_study/20_result/core/network_error.dart';
import 'package:modu_3_dart_study/20_result/core/result.dart';
import 'package:modu_3_dart_study/20_result/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/20_result/dto/user_dto.dart';
import 'package:modu_3_dart_study/20_result/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/20_result/model/user.dart';
import 'package:modu_3_dart_study/20_result/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, NetworkError>> createUser(
    String name,
    String email,
  ) async {
    try {
      final response = await _dataSource
          .createUser(UserDto(name: name, email: email))
          .timeout(Duration(seconds: 10));

      return switch (response.statusCode) {
        >= 200 && <= 299 => Result.success(response.body.toModel()),
        401 => Result.error(NetworkError.unauthorized),
        404 => Result.error(NetworkError.notFound),
        >= 500 && <= 599 => Result.error(NetworkError.serverError),
        _ => Result.error(NetworkError.unknown),
      };
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, NetworkError>> getUser(int id) async {
    try {
      final response = await _dataSource
          .getUser(id)
          .timeout(Duration(seconds: 10));

      return switch (response.statusCode) {
        >= 200 && <= 299 => Result.success(response.body.toModel()),
        401 => Result.error(NetworkError.unauthorized),
        404 => Result.error(NetworkError.notFound),
        >= 500 && <= 599 => Result.error(NetworkError.serverError),
        _ => Result.error(NetworkError.unknown),
      };
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<List<User>, NetworkError>> getUsers() async {
    try {
      final response = await _dataSource.getUsers().timeout(
        Duration(seconds: 10),
      );

      return switch (response.statusCode) {
        >= 200 && <= 299 => Result.success(
          response.body.map((e) => e.toModel()).toList(),
        ),
        401 => Result.error(NetworkError.unauthorized),
        404 => Result.error(NetworkError.notFound),
        >= 500 && <= 599 => Result.error(NetworkError.serverError),
        _ => Result.error(NetworkError.unknown),
      };
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
