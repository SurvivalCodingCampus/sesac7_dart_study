
import 'package:test/test.dart';
import 'package:modu_3_dart_study/user.dart';

void main() {
  test('User 타입의 List 객체의 각 값에 객체로 접근할 수 있다', () async {

    // 구현체 생성
    final userImpl = UserImpl();

    // 인스턴스 생성
    final user = await userImpl.getUsers();
    final testuser = user[0];

    expect(testuser.name, equals('Leanne Graham'));
    expect(testuser.address.street, equals('Kulas Light'));
    expect(testuser.address.geo.lat, equals('-37.3159'));
  });
}
