import 'package:modu_3_dart_study/assignments/movie/movie.dart';
import 'package:test/test.dart';

void main() {
  final title = 'Star Ward';
  final director = 'George Lucas';
  final year = 1977;
  final sampleJson = {
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977,
  };

  group(
    'constructor',
    () {
      test(
        'When create a Movie, the title, director, and year are the given values.',
        () {
          // given
          // when
          final movie = Movie(
            title: title,
            director: director,
            year: year,
          );

          // then
          expect(movie.title, title);
          expect(movie.director, director);
          expect(movie.year, year);
        },
      );
    },
  );

  group('fromJson', () {
    test(
      'If the json is valid, the Movie will be created with the given values.',
      () {
        // given
        // when
        final movie = Movie.fromJson(sampleJson);

        // then
        expect(movie.title, title);
        expect(movie.director, director);
        expect(movie.year, year);
      },
    );

    test(
      'If title is null in the json, the title of the Movie is unknown.',
      () {
        // given
        final json = {"director": director, "year": year};

        // when
        final movie = Movie.fromJson(json);

        // then
        expect(movie.title, Movie.unknown);
        expect(movie.director, director);
        expect(movie.year, year);
      },
    );

    test(
      'If director is null in the json, the director of the Movie is unknown.',
      () {
        // given
        final json = {"title": title, "year": year};

        // when
        final movie = Movie.fromJson(json);

        // then
        expect(movie.title, title);
        expect(movie.director, Movie.unknown);
        expect(movie.year, year);
      },
    );

    test(
      'If year is null in the json, the year of the Movie is 0.',
      () {
        // given
        final json = {"title": title, "director": director};

        // when
        final movie = Movie.fromJson(json);

        // then
        expect(movie.title, title);
        expect(movie.director, director);
        expect(movie.year, Movie.nullYear);
      },
    );

    test('Empty json should use all default values', () {
      // given
      final emptyJson = <String, dynamic>{};

      // when
      final movie = Movie.fromJson(emptyJson);

      // then
      expect(movie.title, Movie.unknown);
      expect(movie.director, Movie.unknown);
      expect(movie.year, Movie.nullYear);
    });
  });

  group('toJson', () {
    test('toJson, it will be the same as the value of jsonString.', () {
      // given
      final movie = Movie(
        title: title,
        director: director,
        year: year,
      );

      // when
      final jsoned = movie.toJson();

      // then
      expect(jsoned, sampleJson);
    });
  });

  group('equality', () {
    test('Same values should be equal', () {
      // given
      final movie1 = Movie(
        title: title,
        director: director,
        year: year,
      );
      final movie2 = Movie(
        title: title,
        director: director,
        year: year,
      );

      // when
      // then
      expect(movie1 == movie2, true);
      expect(movie1.hashCode == movie2.hashCode, true);
    });

    test('Different values should not be equal', () {
      // given
      final movie1 = Movie(
        title: title,
        director: director,
        year: year,
      );
      final movie2 = Movie(
        title: 'Avatar',
        director: 'James Cameron',
        year: 2009,
      );

      // when
      // then
      expect(movie1 == movie2, false);
    });

    test('Object should be equal to itself', () {
      // given
      final movie = Movie(
        title: title,
        director: director,
        year: year,
      );

      // when
      // then
      expect(movie == movie, true);
    });
  });
}
