import 'dart:async';

import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/network_validator.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/data_source/user2/user2_data_source.dart';
import 'package:modu_3_dart_study/dto/user2/user2_dto.dart';
import 'package:modu_3_dart_study/mapper/user2_mapper.dart';
import 'package:modu_3_dart_study/model/user2/user2.dart';
import 'package:modu_3_dart_study/repository/user2/user2_repository.dart';

class User2RepositoryImpl implements User2Repository {
  static const timeLimit = Duration(seconds: 10);

  final User2DataSource _dataSource;
  final NetworkValidator _networkValidator;

  User2RepositoryImpl({
    required User2DataSource dataSource,
    required NetworkValidator validator,
  }) : _dataSource = dataSource,
       _networkValidator = validator;

  @override
  Future<Result<User2, NetworkError>> createUser({
    required String name,
    required int age,
    required String address,
    required String phoneNumber,
  }) async {
    try {
      final response = await _dataSource
          .createUser(
            User2Dto(
              name: name,
              age: age,
              address: address,
              phoneNumber: phoneNumber,
            ),
          )
          .timeout(timeLimit);
      final error = _networkValidator.checkStatusCodeError(response.statusCode);

      if (error != null) {
        return Result.error(error);
      }

      return Result.success(response.body.toModel());
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User2, NetworkError>> getUser(int id) async {
    try {
      final response = await _dataSource.getUsers().timeout(timeLimit);
      final error = _networkValidator.checkStatusCodeError(response.statusCode);

      if (error != null) {
        return Result.error(error);
      }

      return Result.success(
        response.body.map((e) => e.toModel()).firstWhere((e) => e.id == id),
      );
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } on StateError {
      return Result.error(NetworkError.notFound);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<List<User2>, NetworkError>> getUsers() async {
    try {
      final response = await _dataSource.getUsers().timeout(timeLimit);
      final error = _networkValidator.checkStatusCodeError(
        response.statusCode,
      );

      if (error != null) {
        return Result.error(error);
      }

      return Result.success(
        response.body
            .map((e) => e.toModel())
            .where(
              (e) => e.id != User2.invalidId,
            )
            .toList(),
      );
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
