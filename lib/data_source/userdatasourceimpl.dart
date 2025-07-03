import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/userdatasource.dart';

import '../model/User.dart';

class UserDataSourceImpl implements UserDataSource{

  @override
  Future<List<User>> getUsers() async{
    final file = File(filePath);
    String jsonString = file.readAsStringSync();
    List<dynamic> list = jsonDecode(jsonString);
    UserList userList = UserList.fromJson(list);
    return userList.users;
  }
}