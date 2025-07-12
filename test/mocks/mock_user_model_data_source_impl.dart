import 'dart:async';

import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/user_model_data_source.dart';

class MockUserModelDataSourceImpl implements UserModelDataSource {
  final jsonString = '''
 [
  {
    "id": 1,
    "email": "example1@example.com",
    "password": "example1@example.com",
  },
  {
    "id": 2,
    "email": "example2@example.com",
    "password": "example2@example.com",
  },
  {
    "id": 3,
    "email": "example3@example.com",
    "password": "example3@example.com",
  }
]
''';

  final jsonStringById = '''
 {
    "id": 1,
    "email": "example1@example.com",
    "password": "example1@example.com",
  }
''';
  final jsonStringByNewUser = '''
 {
    "id": 4,
    "email": "example4@example.com",
    "password": "example4@example.com",
  }
''';

  @override
  Future<String> getUsers() async {
    return jsonString;
  }

  @override
  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    return jsonStringByNewUser;
  }

  @override
  Future<String> getUser(int id) async {
    return jsonStringById;
  }
}
