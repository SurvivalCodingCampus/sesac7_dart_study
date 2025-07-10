import 'dart:async';
import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-07-09/core/network_error.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/user_model_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/user_model.dart';

abstract interface class UserModelRepository {
  Future<Result<UserModel, NetworkError>> getUser(int id);

  Future<Result<List<UserModel>, NetworkError>> getUsers();

  Future<Result<UserModel, NetworkError>> createUser({
    required String email,
    required String password,
  });
}

class UserModelRepositoryImpl implements UserModelRepository {
  final UserModelDataSource _dataSource;

  UserModelRepositoryImpl(this._dataSource);

  @override
  Future<Result<UserModel, NetworkError>> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final newUserJsonString = await _dataSource.createUser(
        email: email,
        password: password,
      );
      final newUserJson = jsonDecode(newUserJsonString);
      return Result.success(UserModel.fromJson(newUserJson));
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<UserModel, NetworkError>> getUser(int id) async {
    if (id < 0) {
      return Result.error(NetworkError.idError);
    }
    try {
      final userDataByIdJsonSting = await _dataSource.getUser(id);
      final userDataByIdJson = jsonDecode(userDataByIdJsonSting);
      return Result.success(UserModel.fromJson(userDataByIdJson));
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<List<UserModel>, NetworkError>> getUsers() async {
    try {
      final userDataListJsonSting = await _dataSource.getUsers().timeout(
        Duration(seconds: 10),
      );
      final List<Map<String, dynamic>> userDataListJson = jsonDecode(
        userDataListJsonSting,
      );
      return Result.success(
        userDataListJson.map((json) => UserModel.fromJson(json)).toList(),
      );
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
