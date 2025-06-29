import 'dart:convert';

class Movie {
  final String title;
  final String director;
  final int year;

  Movie.fromJson(Map<String, dynamic> map)
    : title = map['title'] ?? '',
      director = map['director'] ?? '',
      year = _checkYear(map['year']);

  static int _checkYear(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else if (value is String) {
      final parsed = num.tryParse(value);
      if (parsed != null) {
        return parsed.toInt();
      }
    }

    return 0;
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'year': year};
  }

  @override
  bool operator ==(Object other) {
    if (other is! Movie) {
      return false;
    }

    if (title == other.title &&
        director == other.director &&
        year == other.year) {
      return true;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      Object.hash(title.hashCode, director.hashCode, year.hashCode);

  @override
  String toString() {
    return 'title: $title, director: $director, year: $year';
  }
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''
  {
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }
  ''';

  return Movie.fromJson(jsonDecode(jsonString));
}

void main() async {
  print(await getMovieInfo());
}
