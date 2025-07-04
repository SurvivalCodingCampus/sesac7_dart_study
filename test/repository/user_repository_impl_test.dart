import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/repository/user_repository_impl.dart';
import 'package:modu_3_dart_study/repository/user_repository.dart';
import 'package:modu_3_dart_study/data_source/local/user_data_source.dart';
import '../mocks/mock_user_data_source_impl.dart';
import 'package:test/test.dart';

void main () async {
  final jsonString = await File('lib/assets/users.json').readAsString();
  List<Map<String, dynamic>> json = jsonDecode(jsonString);

  final UserDataSource userDataSource = MockUserDataSourceImpl(json);
  final UserRepository repository = UserRepositoryImpl(userDataSource);

  test('각 user의 값을 확인할 수 있다', () async {
    final testuser = await repository.getUsers(1);

    expect(testuser.first.name, equals('Leanne Graham'));
  });

  test('이름순으로 정렬된 10개의 값을 얻을 수 있다', () async {
    final testresult = await repository.getUsersTop10ByUserName();
    expect(testresult.length, 10);
  });

  test('이름순으로 정렬된 첫번째 값의 username 은 Antonette이다', () async {
    final testresult = await repository.getUsersTop10ByUserName();
    expect(testresult.first.username, 'Antonette');
  });


}