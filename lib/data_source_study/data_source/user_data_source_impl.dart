import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source_study/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/data_source_study/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  String _userFilePath = 'lib/data_source_study/users.json';

  // getter
  String get userFilePath => _userFilePath;

  // setter
  set userFilePath(String userFilePath) {
    if (userFilePath.isEmpty) {
      throw Exception('파일 경로를 입력해야 합니다.');
    }
    _userFilePath = userFilePath;
  }

  @override
  Future<List<User>> getUsers() async {
    try {
      final List<dynamic> json =
          jsonDecode(
                File(userFilePath).readAsStringSync(),
              )
              as List<dynamic>;
      final List<User> result = json.map((e) => User.fromJson(e)).toList();
      return result;
    } on FileSystemException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('예상치 못한 오류');
    }
  }
}
