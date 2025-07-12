import 'dart:async';

import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/user_model_data_source.dart';

class MockTimeoutUserModelDataSourceImpl implements UserModelDataSource {
  @override
  Future<String> getUsers() async {
    throw TimeoutException('time out');
  }

  @override
  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    throw TimeoutException('time out');
  }

  @override
  Future<String> getUser(int id) async {
    throw TimeoutException('time out');
  }
}
