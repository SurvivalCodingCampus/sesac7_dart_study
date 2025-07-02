import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/14_data_source/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/14_data_source/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    final List<User> users =
        (jsonDecode(File('users.json').readAsStringSync()) as List)
            .map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList();

    return users;
  }
}
