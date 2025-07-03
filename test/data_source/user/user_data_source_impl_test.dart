import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/user/user_data_source_impl.dart';
import 'package:modu_3_dart_study/model/user.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('UserDataSourceImpl Test', () {
    test('getUsers 메서드 return 값 list empty', () async {
      final UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl();
      final List<User> userList = await userDataSourceImpl.getUsers();

      expect(userList.isNotEmpty, isTrue);
    });

    test('getUsers 메서드 return 값 list 요소 객체 검증', () async {
      final File jsonFile = File('json_data/users.json');
      final String jsonString = await jsonFile.readAsString();
      final List jsonList = jsonDecode(jsonString) as List;
      final User jsonGetUser = User.fromJson(jsonList.first);

      final UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl();
      final List<User> userList = await userDataSourceImpl.getUsers();
      final implGetUser = userList.first;

      expect(jsonGetUser.id, equals(implGetUser.id));
      expect(jsonGetUser.username, equals(implGetUser.username));
      expect(jsonGetUser.email, equals(implGetUser.email));
      expect(jsonGetUser.phone, equals(implGetUser.phone));
      expect(jsonGetUser.address, equals(implGetUser.address));
      expect(jsonGetUser.company, equals(implGetUser.company));
      expect(jsonGetUser.website, equals(implGetUser.website));
    });
  });
}
