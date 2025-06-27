import 'dart:convert';

class Movie {
  final String? title;
  final String? director;
  final num? year;

  Movie({
    required this.title,
    required this.director,
    required this.year,
  });

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      year = json['year'] is double
          ? (json['year'] as double)
                .floor() // double이면 소수점 제거
          : json['year'];

  @override
  String toString() => 'Movie(title: $title, director: $director, year: $year)';

  @override
  int get hashCode => Object.hash(title, director, year);

  @override
  bool operator ==(Object other) => other is Movie
      ? title == other.title && director == other.director && year == other.year
      : false;

  Movie copyWith({
    required String? title,
    required String? director,
    required num? year,
  }) => Movie(
    title: title ?? this.title,
    director: director ?? this.director,
    year: year ?? this.year,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'director': director,
    'year': year,
  };
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 1));

  final String jsonString = '''{
    "title": "StartWard",
    "director": "George Lucas",
    "year": 1977
  }''';

  final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  return Movie.fromJson(jsonMap);
}

void main() async {
  try {
    final Movie movie = await getMovieInfo();
    print(movie.title);
  } catch (e) {
    print('error!');
  }
}
