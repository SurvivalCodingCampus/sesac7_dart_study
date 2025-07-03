import 'package:modu_3_dart_study/data_source/userdatasourceimpl.dart';
import 'package:modu_3_dart_study/model/User.dart';
import 'package:test/test.dart';

void main() {
  test('복잡한 Json List 를 List 로 변환 Test', () async {
    //given(준비)
    final int id = 1;
    final String name = 'Leanne Graham';
    final String username = 'Bret';
    final String email = 'Sincere@april.biz';
    final String addressStreet = 'Kulas Light';
    final String addressSuite = 'Apt. 556';
    final String addressCity = 'Gwenborough';
    final String addressZipcode = '92998-3874';
    final String geoLat = '-37.3159';
    final String geoLng = '81.1496';
    final String phone = '1-770-736-8031 x56442';
    final String website = 'hildegard.org';
    final String companyName = 'Romaguera-Crona';
    final String companyCatchPh = 'Multi-layered client-server neural-net';
    final String companyBs = 'harness real-time e-markets';
    UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl();

    //when(실행)
    try {
      List<User> users = await userDataSourceImpl.getUsers();

      //then(검증)
      expect(users[0].id, id);
      expect(users[0].name, name);
      expect(users[0].username, username);
      expect(users[0].email, email);
      expect(users[0].address.street, addressStreet);
      expect(users[0].address.suite, addressSuite);
      expect(users[0].address.city, addressCity);
      expect(users[0].address.zipcode, addressZipcode);
      expect(users[0].address.geo.lat, geoLat);
      expect(users[0].address.geo.lng, geoLng);
      expect(users[0].phone, phone);
      expect(users[0].website, website);
      expect(users[0].company.name, companyName);
      expect(users[0].company.catchPhrase, companyCatchPh);
      expect(users[0].company.bs, companyBs);
    } catch (e) {
      print(e);
    }
  });
}
