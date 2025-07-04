import 'package:modu_3_dart_study/250703/model/user.dart';

abstract interface class UserDataSource {
  Future<List<Map<String, dynamic>>> getUsers();
}
