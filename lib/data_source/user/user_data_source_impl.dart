import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/user/user_data_source.dart';
import 'package:modu_3_dart_study/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    final File jsonFile = File('json_data/users.json');
    if (!await jsonFile.exists()) {
      throw Exception('users Json 파일이 없습니다.');
    }

    final String jsonString = await jsonFile.readAsString();
    if (jsonString.isEmpty) {
      throw Exception('users Json 파일이 비어있습니다.');
    }

    final userJsonList = jsonDecode(jsonString);
    final List<User> userList = (userJsonList as List)
        .map(
          (userJsonMap) => User.fromJson(userJsonMap as Map<String, dynamic>),
        )
        .toList();

    return userList;
  }
}
