import 'dart:convert';

import 'package:modu_3_dart_study/data_source_study/model/company.dart';
import 'package:test/test.dart';

void main() {
  group('Company Test', () {
    test('생성자 테스트', () {
      // given
      final String testName = 'Hoeger LLC';
      final String testCatchPhrase = 'Centralized empowering task-force';
      final String testBs = 'target end-to-end models';
      final Company testCompany = Company(
        name: testName,
        catchPhrase: testCatchPhrase,
        bs: testBs,
      );

      // when & then
      expect(testCompany.name != 'undefined', isTrue);
      expect(testCompany.name, equals(testName));

      expect(testCompany.catchPhrase != 'undefined', isTrue);
      expect(testCompany.catchPhrase, equals(testCatchPhrase));

      expect(testCompany.bs != 'undefined', isTrue);
      expect(testCompany.bs, equals(testBs));
    });

    test('인자 값이 모두 공백일 때 undefined로 값이 잘 들어가는가?', () {
      // given
      final String testName = '';
      final String testCatchPhrase = '';
      final String testBs = '';
      final Company testCompany = Company(
        name: testName,
        catchPhrase: testCatchPhrase,
        bs: testBs,
      );

      // when & then
      expect(testCompany.name == 'undefined', isTrue);
      expect(testCompany.catchPhrase == 'undefined', isTrue);
      expect(testCompany.bs == 'undefined', isTrue);
    });

    test('오류 없는 형태의 json 데이터를 받았을 때 정확한 역직렬화가 가능한가?', () {
      // given
      final String testMessage = '''{
      "name": "Johns Group",
      "catchPhrase": "Configurable multimedia task-force",
      "bs": "generate enterprise e-tailers"
    } ''';
      final Company testCompany = Company.fromJson(jsonDecode(testMessage));

      // when & then
      expect(testCompany.name, equals('Johns Group'));
      expect(
        testCompany.catchPhrase,
        equals('Configurable multimedia task-force'),
      );
      expect(testCompany.bs, equals('generate enterprise e-tailers'));
    });

    test('객체를 json 데이터 형태로 정확한 직렬화가 가능한가?', () {
      // given
      // testMessage는 json 파일에서 그대로 긁어와 공백만 없앤 문자열
      final String testMessage =
          '''{"name":"Johns Group","catchPhrase":"Configurable multimedia task-force","bs":"generate enterprise e-tailers"}''';

      final String testName = 'Johns Group';
      final String testCatchPhrase = 'Configurable multimedia task-force';
      final String testBs = 'generate enterprise e-tailers';
      final Company testCompany = Company(
        name: testName,
        catchPhrase: testCatchPhrase,
        bs: testBs,
      );

      final String encodedString = jsonEncode(testCompany.toJson());

      // when & then
      expect(encodedString, equals(testMessage));
    });
  });
}
