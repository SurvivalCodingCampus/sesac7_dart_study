import 'dart:async';
import 'dart:convert';

import 'package:modu_3_dart_study/20250710/model/user.dart';
import 'package:modu_3_dart_study/20250710/core/network_error.dart';
import 'package:modu_3_dart_study/20250710/core/result.dart';
import 'package:modu_3_dart_study/20250710/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/20250710/dto/user_dto.dart';
import 'package:modu_3_dart_study/20250710/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/20250710/repository/user_repository.dart';
import 'package:modu_3_dart_study/20250710/core/http_util.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, NetworkError>> getUser(int id) async {
    try {
      final response = await _dataSource.getUser(id);

      if (isSuccess(response.statusCode)) {
        final mapData = jsonDecode(response.body);
        final user = UserDto.fromJson(mapData).toUser();

        return Result.success(user);
      } else {
        return Result.error(mapStatusCodeToError(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException catch (_) {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<List<User>, NetworkError>> getUsers() async {
    try {
      final response = await _dataSource.getUsers();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final List<dynamic> mapData = jsonDecode(response.body);
        final users = mapData
            .map((e) => UserDto.fromJson(e))
            .map((e) => e.toUser())
            .toList();

        return Result.success(users);
      } else {
        return Result.error(mapStatusCodeToError(response.statusCode));
      }
    } on TimeoutException catch (_) {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException catch (_) {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, NetworkError>> createUsers(
    Map<String, dynamic> json,
  ) async {
    try {
      final response = await _dataSource.createUser(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final mapData = jsonDecode(response.body);
        final user = UserDto.fromJson(mapData).toUser();

        return Result.success(user);
      } else {
        return Result.error(NetworkError.serverError);
      }
    } on TimeoutException catch (_) {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException catch (_) {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
