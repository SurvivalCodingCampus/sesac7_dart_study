import 'package:modu_3_dart_study/model/address.dart';
import 'package:modu_3_dart_study/model/company.dart';
import 'package:modu_3_dart_study/model/geo.dart';
import 'package:modu_3_dart_study/model/user.dart';
import 'package:test/test.dart';

void main() {
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
  final expectedJson = {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {"lat": "-37.3159", "lng": "81.1496"},
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets",
    },
  };

  group(
    'constructor',
    () {
      test(
        'When create a User, the id, name, username, email, address, phone, website and company are given values.',
        () {
          // given
          // when
          final user = User(
            id: expectedId,
            name: expectedName,
            username: expectedUsername,
            email: expectedEmail,
            address: expectedAddress,
            phone: expectedPhone,
            website: expectedWebsite,
            company: expectedCompany,
          );

          // then
          expect(user.id, expectedId);
          expect(user.name, expectedName);
          expect(user.username, expectedUsername);
          expect(user.email, expectedEmail);
          expect(user.address, expectedAddress);
          expect(user.phone, expectedPhone);
          expect(user.website, expectedWebsite);
          expect(user.company, expectedCompany);
        },
      );

      test(
        'When create a User with all values null, the id, name, username, email, address, phone, website and company are null.',
        () {
          // given
          // when
          final user = User(
            id: null,
            name: null,
            username: null,
            email: null,
            address: null,
            phone: null,
            website: null,
            company: null,
          );

          // then
          expect(user.id, null);
          expect(user.name, null);
          expect(user.username, null);
          expect(user.email, null);
          expect(user.address, null);
          expect(user.phone, null);
          expect(user.website, null);
          expect(user.company, null);
        },
      );
    },
  );

  group('fromJson', () {
    test(
      'If the json contains all the values and create User.fromJson, the id, name, username, email, address, phone, website and company are the given values.',
      () {
        // given

        // when
        final user = User.fromJson(expectedJson);

        // then
        expect(user.id, expectedId);
        expect(user.name, expectedName);
        expect(user.username, expectedUsername);
        expect(user.email, expectedEmail);
        expect(user.address, expectedAddress);
        expect(user.phone, expectedPhone);
        expect(user.website, expectedWebsite);
        expect(user.company, expectedCompany);
      },
    );

    test(
      'If all values in the json are null and create User.fromJson, the id, name, username, email, address, phone, website and company are the given values.',
      () {
        // given
        final json = <String, dynamic>{};

        // when
        final user = User.fromJson(json);

        // then
        expect(user.id, null);
        expect(user.name, null);
        expect(user.username, null);
        expect(user.email, null);
        expect(user.address, null);
        expect(user.phone, null);
        expect(user.website, null);
        expect(user.company, null);
      },
    );
  });

  group('toJson', () {
    test(
      'If user has all values, the result of toJson is the same as expectedJson.',
      () {
        // given
        final user = User(
          id: expectedId,
          name: expectedName,
          username: expectedUsername,
          email: expectedEmail,
          address: expectedAddress,
          phone: expectedPhone,
          website: expectedWebsite,
          company: expectedCompany,
        );

        // when
        final result = user.toJson();

        // then
        expect(result, expectedJson);
      },
    );
  });

  group('copyWith', () {
    test(
      'If user contains all values and copyWith is performed, the copied user is a different object and has the same values.',
      () {
        // given
        final user = User(
          id: expectedId,
          name: expectedName,
          username: expectedUsername,
          email: expectedEmail,
          address: expectedAddress,
          phone: expectedPhone,
          website: expectedWebsite,
          company: expectedCompany,
        );

        // when
        final copied = user.copyWith();

        // then
        expect(identical(user, copied), isFalse);
        expect(user == copied, isTrue);
      },
    );

    test(
      'If user contains all the values and you do a copyWith with a new id, the copied user will have a different id.',
      () {
        // given
        final user = User(
          id: expectedId,
          name: expectedName,
          username: expectedUsername,
          email: expectedEmail,
          address: expectedAddress,
          phone: expectedPhone,
          website: expectedWebsite,
          company: expectedCompany,
        );
        final newId = 2;

        // when
        final copied = user.copyWith(id: newId);

        // then
        expect(identical(user, copied), isFalse);
        expect(copied.id, newId);
        expect(copied.name, expectedName);
        expect(copied.username, expectedUsername);
        expect(copied.email, expectedEmail);
        expect(copied.address, expectedAddress);
        expect(copied.phone, expectedPhone);
        expect(copied.website, expectedWebsite);
        expect(copied.company, expectedCompany);
      },
    );
  });
}
