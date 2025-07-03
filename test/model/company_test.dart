import 'package:modu_3_dart_study/model/company.dart';
import 'package:test/test.dart';

void main() {
  final expectedName = "Romaguera-Crona";
  final expectedCatchPhrase = "Multi-layered client-server neural-net";
  final expectedBs = "harness real-time e-markets";
  final expectedJson = {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets",
  };
  final company = Company(
    name: expectedName,
    catchPhrase: expectedCatchPhrase,
    bs: expectedBs,
  );

  group(
    'constructor',
    () {
      test(
        'When create a Company, name, catchPhrase and bs are given values.',
        () {
          // given
          // when

          // then
          expect(company.name, expectedName);
          expect(company.catchPhrase, expectedCatchPhrase);
          expect(company.bs, expectedBs);
        },
      );

      test(
        'When create a Company with all values null, the name, catchPhrase and bs are null.',
        () {
          // given
          // when
          final company = Company(
            name: null,
            catchPhrase: null,
            bs: null,
          );

          // then
          expect(company.name, null);
          expect(company.catchPhrase, null);
          expect(company.bs, null);
        },
      );
    },
  );

  group('fromJson', () {
    test(
      'If the json contains all the values and create Company.fromJson, the name, catchPhrase and bs are the given values.',
      () {
        // given

        // when
        final company = Company.fromJson(expectedJson);

        // then
        expect(company.name, expectedName);
        expect(company.catchPhrase, expectedCatchPhrase);
        expect(company.bs, expectedBs);
      },
    );

    test(
      'If all values in the json are null and create Company.fromJson, the name, catchPhrase and bs are the given values.',
      () {
        // given
        final json = <String, dynamic>{};

        // when
        final company = Company.fromJson(json);

        // then
        expect(company.name, null);
        expect(company.catchPhrase, null);
        expect(company.bs, null);
      },
    );
  });

  group('toJson', () {
    test(
      'If company has all values, the result of toJson is the same as expectedJson.',
      () {
        // given

        // when
        final result = company.toJson();

        // then
        expect(result, expectedJson);
      },
    );
  });

  group('copyWith', () {
    test(
      'If company contains all values and copyWith is performed, the copied company is a different object and has the same values.',
      () {
        // given

        // when
        final copied = company.copyWith();

        // then
        expect(identical(company, copied), isFalse);
        expect(company == copied, isTrue);
      },
    );

    test(
      'If company contains all the values and you do a copyWith with a new name, the copied company will have a different name.',
      () {
        // given
        final newName = 'new name';

        // when
        final copied = company.copyWith(name: newName);

        // then
        expect(identical(company, copied), isFalse);
        expect(copied.name, newName);
        expect(copied.catchPhrase, expectedCatchPhrase);
        expect(copied.bs, expectedBs);
      },
    );
  });
}
