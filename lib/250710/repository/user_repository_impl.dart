import 'dart:async';

import 'package:modu_3_dart_study/250710/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/250710/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/250710/repository/user_repository.dart';

import '../core/enums.dart';
import '../core/result.dart';
import '../dto/user_dto.dart';
import '../model/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<Result<List<User>, NetworkError>> getUsers() async {
    try {
      final response = await _userDataSource.getUsers().timeout(
        Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        return Result.success(response.body.map((e) => e.toModel()).toList());
      } else {
        return Result.error(NetworkError.fromStatusCode(response.statusCode));
      }
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    }
  }

  @override
  Future<Result<User, NetworkError>> getUser({required int id}) async {
    try {
      final response = await _userDataSource
          .getUser(id: id)
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return Result.success(response.body.toModel());
      } else {
        return Result.error(NetworkError.fromStatusCode(response.statusCode));
      }
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    }
  }

  @override
  Future<Result<User, NetworkError>> addUser({required User user}) async {
    try {
      final response = await _userDataSource
          .addUser(
            userDto: UserDto(id: user.id, name: user.name),
          )
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return Result.success(response.body.toModel());
      } else {
        return Result.error(NetworkError.fromStatusCode(response.statusCode));
      }
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    }
  }
}
