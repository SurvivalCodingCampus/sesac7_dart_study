import 'dart:convert';

import 'package:modu_3_dart_study/data_source_study/model/geo.dart';
import 'package:test/test.dart';

void main() {
  group('Geo Test', () {
    test('생성자 테스트', () {
      // given
      final String testLat = '24.8918';
      final String testLng = '21.8984';
      final Geo testGeo = Geo(lat: testLat, lng: testLng);

      // when & then
      expect(testGeo.lat != 'undefined', isTrue);
      expect(testGeo.lat, equals(testLat));

      expect(testGeo.lng != 'undefined', isTrue);
      expect(testGeo.lng, equals(testLng));
    });

    test('인자 값이 모두 공백일 때 undefined로 값이 잘 들어가는가?', () {
      // given
      final String testLat = '';
      final String testLng = '';
      final Geo testGeo = Geo(lat: testLat, lng: testLng);

      // when & then
      expect(testGeo.lat == 'undefined', isTrue);
      expect(testGeo.lng == 'undefined', isTrue);
    });

    test('오류 없는 형태의 json 데이터를 받았을 때 정확한 역직렬화가 가능한가?', () {
      // given
      final String testMessage = '''{
        "lat": "24.8918",
        "lng": "21.8984"
      }''';
      final Geo testGeo = Geo.fromJson(jsonDecode(testMessage));

      // when & then
      expect(testGeo.lat, equals('24.8918'));
      expect(testGeo.lng, equals('21.8984'));
    });

    test('객체를 json 데이터 형태로 정확한 직렬화가 가능한가?', () {
      // given
      // testMessage는 json 파일에서 그대로 긁어와 공백만 없앤 문자열
      final String testMessage = '''{"lat":"24.8918","lng":"21.8984"}''';

      final String testLat = '24.8918';
      final String testLng = '21.8984';
      final Geo testGeo = Geo(lat: testLat, lng: testLng);

      final String encodedString = jsonEncode(testGeo.toJson());

      // when & then
      expect(encodedString, equals(testMessage));
    });
  });
}
