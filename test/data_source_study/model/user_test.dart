import 'dart:convert';

import 'package:modu_3_dart_study/data_source_study/model/address.dart';
import 'package:modu_3_dart_study/data_source_study/model/company.dart';
import 'package:modu_3_dart_study/data_source_study/model/geo.dart';
import 'package:modu_3_dart_study/data_source_study/model/user.dart';
import 'package:test/test.dart';

void main() {
  group('User Test', () {
    test('생성자 테스트', () {
      // given
      final int id = 7;
      final String name = 'Kurtis Weissnat';
      final String username = 'Elwyn.Skiles';
      final String email = 'Telly.Hoeger@billy.biz';
      final Address address = Address(
        street: 'Rex Trail',
        suite: 'Suite 280',
        city: 'Howemouth',
        zipcode: '58804-1099',
        geo: Geo(lat: '24.8918', lng: '21.8984'),
      );

      final String phone = '210.067.6132';
      final String website = 'elvis.io';
      final Company company = Company(
        name: 'Johns Group',
        catchPhrase: 'Configurable multimedia task-force',
        bs: 'generate enterprise e-tailers',
      );
      final User user = User(
        id: id,
        name: name,
        username: username,
        email: email,
        address: address,
        phone: phone,
        website: website,
        company: company,
      );

      // when & then
      expect(user.id, equals(id));
      expect(user.name, equals(name));
      expect(user.username, equals(username));
      expect(user.email, equals(email));
      expect(user.address, equals(address));
      expect(user.phone, equals(phone));
      expect(user.website, equals(website));
      expect(user.company, equals(company));
    });

    test('id 값이 1보다 작을 때 기본 값으로 설정되는가?', () {
      // given
      // 경계값 설정
      final int testId1 = -1;
      final int testId2 = 0;
      final int testId3 = 1;

      final String name = 'Kurtis Weissnat';
      final String username = 'Elwyn.Skiles';
      final String email = 'Telly.Hoeger@billy.biz';
      final Address address = Address(
        street: 'Rex Trail',
        suite: 'Suite 280',
        city: 'Howemouth',
        zipcode: '58804-1099',
        geo: Geo(lat: '24.8918', lng: '21.8984'),
      );

      final String phone = '210.067.6132';
      final String website = 'elvis.io';
      final Company company = Company(
        name: 'Johns Group',
        catchPhrase: 'Configurable multimedia task-force',
        bs: 'generate enterprise e-tailers',
      );
      final User user1 = User(
        id: testId1,
        name: name,
        username: username,
        email: email,
        address: address,
        phone: phone,
        website: website,
        company: company,
      );
      final User user2 = User(
        id: testId2,
        name: name,
        username: username,
        email: email,
        address: address,
        phone: phone,
        website: website,
        company: company,
      );
      final User user3 = User(
        id: testId3,
        name: name,
        username: username,
        email: email,
        address: address,
        phone: phone,
        website: website,
        company: company,
      );

      // when & then
      expect(user1.id, equals(User.defaultIdValue));
      expect(user2.id, equals(User.defaultIdValue));
      expect(user3.id, equals(testId3));
    });

    test('오류 없는 형태의 json 데이터를 받았을 때 정확한 역직렬화가 가능한가?', () {
      // given
      final String testMessage = '''{
    "id": 8,
    "name": "Nicholas Runolfsdottir V",
    "username": "Maxime_Nienow",
    "email": "Sherwood@rosamond.me",
    "address": {
      "street": "Ellsworth Summit",
      "suite": "Suite 729",
      "city": "Aliyaview",
      "zipcode": "45169",
      "geo": {
        "lat": "-14.3990",
        "lng": "-120.7677"
      }
    },
    "phone": "586.493.6943 x140",
    "website": "jacynthe.com",
    "company": {
      "name": "Abernathy Group",
      "catchPhrase": "Implemented secondary concept",
      "bs": "e-enable extensible e-tailers"
    }
  }''';
      final User user = User.fromJson(jsonDecode(testMessage));

      // when & then
      expect(user.id, equals(8));
      expect(user.name, equals('Nicholas Runolfsdottir V'));
      expect(user.username, equals('Maxime_Nienow'));
      expect(user.email, equals('Sherwood@rosamond.me'));
      expect(
        user.address,
        equals(
          Address(
            street: 'Ellsworth Summit',
            suite: 'Suite 729',
            city: 'Aliyaview',
            zipcode: '45169',
            geo: Geo(lat: '-14.3990', lng: '-120.7677'),
          ),
        ),
      );
      expect(user.phone, equals('586.493.6943 x140'));
      expect(user.website, equals('jacynthe.com'));
      expect(
        user.company,
        equals(
          Company(
            name: 'Abernathy Group',
            catchPhrase: 'Implemented secondary concept',
            bs: 'e-enable extensible e-tailers',
          ),
        ),
      );
    });

    test('객체를 json 데이터 형태로 정확한 직렬화가 가능한가?', () {
      // given
      // testMessage는 json 파일에서 그대로 긁어와 공백만 없앤 문자열
      final String testMessage =
          '''{"id":7,"name":"Kurtis Weissnat","username":"Elwyn.Skiles","email":"Telly.Hoeger@billy.biz","address":{"street":"Rex Trail","suite":"Suite 280","city":"Howemouth","zipcode":"58804-1099","geo":{"lat":"24.8918","lng":"21.8984"}},"phone":"210.067.6132","website":"elvis.io","company":{"name":"Johns Group","catchPhrase":"Configurable multimedia task-force","bs":"generate enterprise e-tailers"}}''';

      final int id = 7;
      final String name = 'Kurtis Weissnat';
      final String username = 'Elwyn.Skiles';
      final String email = 'Telly.Hoeger@billy.biz';
      final Address address = Address(
        street: 'Rex Trail',
        suite: 'Suite 280',
        city: 'Howemouth',
        zipcode: '58804-1099',
        geo: Geo(lat: '24.8918', lng: '21.8984'),
      );

      final String phone = '210.067.6132';
      final String website = 'elvis.io';
      final Company company = Company(
        name: 'Johns Group',
        catchPhrase: 'Configurable multimedia task-force',
        bs: 'generate enterprise e-tailers',
      );
      final User user = User(
        id: id,
        name: name,
        username: username,
        email: email,
        address: address,
        phone: phone,
        website: website,
        company: company,
      );

      final String encodedString = jsonEncode(user.toJson());

      // when & then
      expect(encodedString, equals(testMessage));
    });
  });
}
