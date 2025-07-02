import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source_study/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/data_source_study/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    try {
      final List<dynamic> json =
          jsonDecode(
                File('lib/data_source_study/users.json').readAsStringSync(),
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

void main() async {
  UserDataSourceImpl impl = UserDataSourceImpl();
  List<User> a = await impl.getUsers();
  print(a.toString());
}
