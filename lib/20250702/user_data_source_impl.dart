import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/20250702/user_data_source.dart';
import 'package:modu_3_dart_study/20250702/user.dart';

import '../20250625/my_exception.dart';

class UserDataSourceImpl implements UserDataSource {
  String _contents = '';

  @override
  Future<List<User?>> getUsers(String filePath) {
    final sourceFile = File(filePath);
    if (!sourceFile.existsSync()) throw MyException(MyException.FILE_NOT_FOUND);

    _contents = sourceFile.readAsStringSync();
    if(_contents.isEmpty) throw MyException(MyException.FILE_CONTENTS_EMPTY);

    try {
      final List<dynamic> todoMap = jsonDecode(_contents);
      final userList = todoMap.map((e) => User.fromMap(e)).toList();
      return Future.value(userList);
    } catch (e) {
      return Future.value([]);
    }
  }
}
