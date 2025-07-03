import 'package:modu_3_dart_study/model/geo.dart';
import 'package:test/test.dart';

void main() {
  final expectedLat = "-37.3159";
  final expectedLng = "81.1496";
  final expectedJson = {"lat": "-37.3159", "lng": "81.1496"};
  final geo = Geo(lat: expectedLat, lng: expectedLng);

  group(
    'constructor',
    () {
      test(
        'When create a Geo, lat, and lng are given values.',
        () {
          // given
          // when

          // then
          expect(geo.lat, expectedLat);
          expect(geo.lng, expectedLng);
        },
      );

      test(
        'When create a Geo with all values null, the lat and lng are null.',
        () {
          // given
          // when
          final geo = Geo(lat: null, lng: null);

          // then
          expect(geo.lat, null);
          expect(geo.lng, null);
        },
      );
    },
  );

  group('fromJson', () {
    test(
      'If the json contains all the values and create Geo.fromJson, the lat, lng are the given values.',
      () {
        // given

        // when
        final geo = Geo.fromJson(expectedJson);

        // then
        expect(geo.lat, expectedJson['lat']);
        expect(geo.lng, expectedJson['lng']);
      },
    );

    test(
      'If all values in the json are null and create Geo.fromJson, the lat, lng are the given values.',
      () {
        // given
        final json = <String, dynamic>{};

        // when
        final geo = Geo.fromJson(json);

        // then
        expect(geo.lat, null);
        expect(geo.lng, null);
      },
    );
  });

  group('toJson', () {
    test(
      'If geo has all values, the result of toJson is the same as expectedJson.',
      () {
        // given

        // when
        final result = geo.toJson();

        // then
        expect(result, expectedJson);
      },
    );
  });

  group('copyWith', () {
    test(
      'If geo contains all values and copyWith is performed, the copied geo is a different object and has the same values.',
      () {
        // given

        // when
        final copied = geo.copyWith();

        // then
        expect(identical(geo, copied), isFalse);
        expect(geo == copied, isTrue);
      },
    );

    test(
      'If geo contains all the values and you do a copyWith with a new lat, the copied geo will have a different lat.',
      () {
        // given
        final newLat = '-30';

        // when
        final copied = geo.copyWith(lat: newLat);

        // then
        expect(identical(geo, copied), isFalse);
        expect(copied.lat, newLat);
        expect(copied.lng, expectedLng);
      },
    );
  });
}
