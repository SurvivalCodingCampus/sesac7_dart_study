import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-07-02/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-02/models/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final file = File('lib/assignments/2025-07-02/user.json');
      final fileString = file.readAsStringSync();

      User user = User.fromJson(jsonDecode(fileString));
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final file = File('lib/assignments/2025-07-02/users.json');
      final fileString = file.readAsStringSync();

      List<Map<String, dynamic>> users = jsonDecode(
        fileString,
      ).map((e) => User.fromJson(e)).toList();
      return users;
    } catch (e) {
      throw [];
    }
  }
}

void main() async {
  User user1 = await UserDataSourceImpl().getUser();
  print('id: ${user1.id}');
  print('username: ${user1.username}');
  print('geo.lat: ${user1.address.geo.lat}');

  // "name": "Leanne Graham",
  // "username": "Bret",
  // "email": "Sincere@april.biz",
  // "address": {
  // "street": "Kulas Light",
  // "suite": "Apt. 556",
  // "city": "Gwenborough",
  // "zipcode": "92998-3874",
  // "geo": {
  // "lat": "-37.3159",
  // "lng": "81.1496"
  // }
  //
  // print('userId: ${todo1.userId}');
  // print('title: ${todo1.title}');
  // print('completed: ${todo1.completed}');
  //
  // List<User> users = await UserDataSourceImpl().getUsers();
  // print('------------------------');
  // print('runtimeType: ${users.runtimeType}');
  // print('length: ${users.length}');
  // print('id: ${users[0].id}');
  // print('username: ${users[0].username}');
  // print('geo.lat: ${users[0].address.geo.lat}');
}
