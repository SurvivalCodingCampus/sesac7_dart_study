import 'package:modu_3_dart_study/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/model/address.dart';
import 'package:modu_3_dart_study/model/company.dart';
import 'package:modu_3_dart_study/model/geo.dart';

import 'package:test/test.dart';

void main() {
  group(
    'getUsers',
    () {
      test(
        'If the json file is healthy, the first value of getUsers will be the same as the expected values.',
        () async {
          // given
          final expectedId = 1;
          final expectedName = "Leanne Graham";
          final expectedUsername = "Bret";
          final expectedEmail = "Sincere@april.biz";
          final expectedAddress = Address(
            street: "Kulas Light",
            suite: "Apt. 556",
            city: "Gwenborough",
            zipcode: "92998-3874",
            geo: Geo(lat: "-37.3159", lng: "81.1496"),
          );
          final expectedPhone = "1-770-736-8031 x56442";
          final expectedWebsite = "hildegard.org";
          final expectedCompany = Company(
            name: "Romaguera-Crona",
            catchPhrase: "Multi-layered client-server neural-net",
            bs: "harness real-time e-markets",
          );

          // when
          final users = await UserDataSourceImpl().getUsers();
          final first = users.first;

          // then
          expect(first.id, expectedId);
          expect(first.name, expectedName);
          expect(first.username, expectedUsername);
          expect(first.email, expectedEmail);
          expect(first.address, expectedAddress);
          expect(first.phone, expectedPhone);
          expect(first.website, expectedWebsite);
          expect(first.company, expectedCompany);
        },
      );
    },
  );
}
