import 'dart:convert';

import 'package:modu_3_dart_study/11_async_programming/movie.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final String testTitle = 'Star Ward';
  final String testDirector = 'George Lucas';
  final int testYear = 1977;
  final String jsonString =
      '''{
    "title": "$testTitle",
    "director": "$testDirector",
    "year": $testYear
  }''';
  final String jsonStringIncludeNull = '''{
  }''';

  group('MovieClassTest', () {
    test('toJson을 사용한 직렬화 후 인스턴스 필드와 jsonMap value와 동일한지 검증', () {
      final Movie testMovie = Movie(
        title: testTitle,
        director: testDirector,
        year: testYear,
      );
      final Map<String, dynamic> testMovieJson = testMovie.toJson();

      expect(testMovieJson['title'], equals(testMovie.title));
      expect(testMovieJson['director'], equals(testMovie.director));
      expect(testMovieJson['year'], equals(testMovie.year));
    });

    test('fromJson을 사용한 역직렬화 후 인스턴스 필드와 동일한지 검증', () {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final Movie testMovie = Movie.fromJson(jsonMap);

      expect(testMovie.title, equals(testTitle));
      expect(testMovie.director, equals(testDirector));
      expect(testMovie.year, equals(testYear));
    });

    test('null이 있는 jsonString을 fromJson을 사용한 역직렬화 후 인스턴스 필드 null 검증', () {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final Movie testMovie = Movie.fromJson(jsonMap);

      expect(testMovie.title, isNull);
      expect(testMovie.director, isNull);
      expect(testMovie.year, isNull);
    });

    group('getMovieInfo 테스트', () {
      test('getMovieInfo 함수 리턴 Movie 객체 검증', () async {
        final Movie movie = await getMovieInfo();

        expect(movie.title, equals('Star Ward'));
        expect(movie.director, equals('George Lucas'));
        expect(movie.year, equals(1977));
      });
      test('getMovieInfo 함수 리턴 1초 검증', () async {
        final Stopwatch stopwatch = Stopwatch()..start();

        await getMovieInfo();

        expect(stopwatch.elapsed.inSeconds, 1);
      });
    });
  });
}
