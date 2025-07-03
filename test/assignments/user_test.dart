import 'package:modu_3_dart_study/assignments/data_source/user_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  group('UserDataSourceImpl 클래스 테스트 (실제 파일 사용)', () {
    final validDataSource = UserDataSourceImpl(
      usersPath: 'lib/assignments/data_source/data/user.json',
    );

    final invalidDataSource = UserDataSourceImpl(
      usersPath: 'invalid_file.json',
    );

    group('성공 케이스', () {
      test('users.json List<User>를 생성', () async {
        final users = await validDataSource.getUsers();

        expect(users.length, 10, reason: '전체 사용자수 10 명');

        final firstUser = users.first;
        expect(firstUser.id, 1);
        expect(firstUser.name, 'Leanne Graham');
        expect(firstUser.address.city, 'Gwenborough');
        expect(firstUser.company.name, 'Romaguera-Crona');

        final lastUser = users.last;
        expect(lastUser.id, 10);
        expect(lastUser.name, 'Clementina DuBuque');
      });
    });

    group('실패 케이스', () {
      test('존재하지 않는 파일을 읽으면 Exception', () {
        expect(
          () async => await invalidDataSource.getUsers(),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
