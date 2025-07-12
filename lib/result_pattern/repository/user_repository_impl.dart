import 'dart:async';

import 'package:modu_3_dart_study/result_pattern/core/network_error.dart';
import 'package:modu_3_dart_study/result_pattern/core/result.dart';
import 'package:modu_3_dart_study/result_pattern/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/result_pattern/dto/user_dto.dart';
import 'package:modu_3_dart_study/result_pattern/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/result_pattern/model/user.dart';
import 'package:modu_3_dart_study/result_pattern/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  static const int success = 200;
  static const int unauthorized = 401;
  static const int notFound = 404;
  static const int requestTimeout = 408;
  static const int serverError = 500;

  final UserDataSource _userDataSource;
  final int timeOutSeconds = 10;

  UserRepositoryImpl({required UserDataSource userDataSource})
    : _userDataSource = userDataSource;

  @override
  Future<Result<List<User>, NetworkError>> getAllUsers() async {
    try {
      // Response<List<UserDto>>
      final response = await _userDataSource.getUsers().timeout(
        Duration(seconds: timeOutSeconds),
      ); // requestTimeout 발생 가능 지점

      switch (response.statusCode) {
        case success:
          return Result.success(
            response.body.map((UserDto dto) => dto.toUser()).toList(),
          );
        case unauthorized:
          return Result.error(NetworkError.unauthorized);
        case notFound:
          return Result.error(NetworkError.notFound);
        case serverError:
          return Result.error(NetworkError.serverError);
        default:
          return Result.error(NetworkError.unknown);
      }
    } on TimeoutException catch (e) {
      print(e.message);
      return Result.error(NetworkError.requestTimeout);
    } on FormatException catch (e) {
      print(e.message);
      return Result.error(NetworkError.parseError);
    } catch (e) {
      print('예상치 못한 에러');
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, NetworkError>> getUserById(int id) async {
    try {
      // Response<List<UserDto>>
      final response = await _userDataSource
          .getUser(id)
          .timeout(
            Duration(seconds: timeOutSeconds),
          ); // requestTimeout 발생 가능 지점

      switch (response.statusCode) {
        case success:
          return Result.success(response.body.toUser());
        case unauthorized:
          return Result.error(NetworkError.unauthorized);
        case notFound:
          return Result.error(NetworkError.notFound);
        case serverError:
          return Result.error(NetworkError.serverError);
        default:
          return Result.error(NetworkError.unknown);
      }
    } on TimeoutException catch (e) {
      print(e.message);
      return Result.error(NetworkError.requestTimeout);
    } on FormatException catch (e) {
      print(e.message);
      return Result.error(NetworkError.parseError);
    } catch (e) {
      print('예상치 못한 에러');
      return Result.error(NetworkError.unknown);
    }
  }
}
