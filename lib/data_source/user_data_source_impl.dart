import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    final file = File('assets/users.json');
    final jsonString = await file.readAsString();
    final json = jsonDecode(jsonString);
    return (json as List).map((e) => User.fromJson(e)).toList();
  }
}
