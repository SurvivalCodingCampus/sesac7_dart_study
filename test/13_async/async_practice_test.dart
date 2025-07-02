import 'dart:convert';

import 'package:modu_3_dart_study/13_async/async_practice.dart';
import 'package:modu_3_dart_study/13_async/movie.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Movie 클래스 직렬화 테스트 & getMovieInfo() 테스트', () {
    final String jsonStringNormal = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }''';
    final String jsonStringNull = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year": null
    }''';
    final String jsonStringAllNull = '''{
    "title": null,
    "director": null,
    "year": null
  }''';
    final String jsonStringNotCorrectType = '''{
    "title": 1977,
    "director": 55,
    "year": "George Lucas"
  }''';
    final String jsonStringNullWithNotCorrectType = '''{
    "title": 1977,
    "director": null,
    "year": "George Lucas"
  }''';
    final String notCorrectJsonFormat = '''{
    "title": 1977,
    "dire
    "year": "George Lucas"
  }''';
    final jsonBefore = jsonDecode(jsonStringNormal);
    final jsonBeforeNull = jsonDecode(jsonStringNull);
    final jsonBeforeAllNull = jsonDecode(jsonStringAllNull);
    final jsonBeforeNotCorrectType = jsonDecode(jsonStringNotCorrectType);
    final jsonBeforeNullWithNotCorrectType = jsonDecode(
      jsonStringNullWithNotCorrectType,
    );

    final Movie movieInfoNormal = Movie.fromJson(jsonBefore);
    final Movie movieInfoNull = Movie.fromJson(jsonBeforeNull);
    final Movie movieInfoAllNull = Movie.fromJson(jsonBeforeAllNull);
    final Movie movieInfoNotCorrectType = Movie.fromJson(
      jsonBeforeNotCorrectType,
    );
    final Movie movieInfoNullWithNotCorrectType = Movie.fromJson(
      jsonBeforeNullWithNotCorrectType,
    );

    final jsonAfterNormal = movieInfoNormal.toJson();
    final jsonAfterNull = movieInfoNull.toJson();
    final jsonAfterAllNull = movieInfoAllNull.toJson();
    final jsonAfterNotCorrectType = movieInfoNotCorrectType.toJson();
    final jsonAfterNullWithNotCorrectType = movieInfoNullWithNotCorrectType
        .toJson();
    final String movieTitle = 'Star Ward';
    final String movieDirector = 'George Lucas';
    final num movieYear = 1977;

    test('Movie 클래스 역직렬화 테스트', () {
      expect(movieInfoNormal.title == movieTitle, isTrue);
      expect(movieInfoNormal.director == movieDirector, isTrue);
      expect(movieInfoNormal.year == movieYear, isTrue);

      expect(movieInfoNull.year, isNull);

      expect(movieInfoAllNull.title, isNull);
      expect(movieInfoAllNull.director, isNull);
      expect(movieInfoAllNull.year, isNull);

      expect(movieInfoNotCorrectType.title, isNull);
      expect(movieInfoNotCorrectType.director, isNull);
      expect(movieInfoNotCorrectType.year, isNull);

      expect(movieInfoNullWithNotCorrectType.title, isNull);
      expect(movieInfoNullWithNotCorrectType.director, isNull);
      expect(movieInfoNullWithNotCorrectType.year, isNull);

      expect(() => jsonDecode(notCorrectJsonFormat), throwsFormatException);
    });

    test('Movie 클래스 직렬화 테스트', () {
      expect(jsonAfterNormal, equals(jsonDecode(jsonStringNormal)));
      expect(jsonAfterNull, equals(jsonDecode(jsonStringNull)));
      expect(jsonAfterAllNull, equals(jsonDecode(jsonStringAllNull)));
      expect(
        jsonAfterNotCorrectType,
        equals(jsonDecode(jsonStringAllNull)),
      );
      expect(
        jsonAfterNullWithNotCorrectType,
        equals(jsonDecode(jsonStringAllNull)),
      );
    });

    test('getMovieInfo() 테스트', () async {
      final asyncMovieInfo = await getMovieInfo();
      expect(asyncMovieInfo, equals(movieInfoNormal));
      expect(asyncMovieInfo.title, equals(movieTitle));
    });
  });
}
