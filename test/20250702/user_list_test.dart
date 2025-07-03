import 'package:modu_3_dart_study/20250702/user_data_source_impl.dart';
import 'package:modu_3_dart_study/20250702/user.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('', () {
    test('user list 데이터 가져오기', () async {
      UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl();
      final userList = await userDataSourceImpl.getUsers('user_info_list.json');

      expect(userList , isA<List<User?>>());
      expect(userList.length , 10);
    });
  });
}
