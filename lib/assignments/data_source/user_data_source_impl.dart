import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/data_source/user_model.dart';

class UserDataSourceImpl implements UserDataSource {
  final String _usersPath;

  UserDataSourceImpl({required String usersPath}) : _usersPath = usersPath;

  @override
  Future<List<User>> getUsers() async {
    final jsonString = await File(_usersPath).readAsString();
    final jsonList = jsonDecode(jsonString) as List;

    return jsonList.map((jsonMap) => User.fromJson(jsonMap)).toList();
  }
}
