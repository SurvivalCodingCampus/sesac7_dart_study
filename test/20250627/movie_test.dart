import 'dart:convert';

import 'package:modu_3_dart_study/20250627/movie.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('', () {
    final String testJsons = '''[
      {
        "title": "Star Ward",
        "director": "George Lucas",
        "year": 1977
      },
      {
        "title": "The Empire Strikes Back",
        "director": "Irvin Kershner",
        "year": 1980
      },
      {
        "title": "우뢰매",
        "director": "심형래",
        "year": 1985
      }
    ]''';

    final String testJsons2 = '''[
      {
        "title": "Star Ward",
        "director": "George Lucas"
      },
      {
        "director": "Irvin Kershner",
        "year": 1980
      },
      {
        "director": "심형래",
        "year": 1985
      },
      {
        "title": "우뢰매",
        "director": "심형래",
        "year": 1985
      }
    ]''';

    test('title이 모두 있는지 테스트', () async {
      final movieArray = jsonDecode(testJsons);
      List<Movie> movieList = (movieArray as List<dynamic>).map((e) => Movie.fromJson(e)).toList();

      for(var movie in movieList) {
        final map = movie.toJson();
        final jsonString = jsonEncode(map);

        final movieInfo = await getMoviewInfoToJson(jsonString);
        print(movieInfo.toString());
        expect(movieInfo.title?.isNotEmpty , isTrue);
      }
    });

    test('json 데이터중 필드가 없는 경우 테스트', () async {
      final movieArray = jsonDecode(testJsons2);
      List<Movie> movieList = (movieArray as List<dynamic>).map((e) => Movie.fromJson(e)).toList();

      for(var movie in movieList) {
        final map = movie.toJson();
        final jsonString = jsonEncode(map);

        final movieInfo = await getMoviewInfoToJson(jsonString);
        print(movieInfo.toString());
        expect(movieInfo , isA<Movie>());
      }
    });
  });
}
