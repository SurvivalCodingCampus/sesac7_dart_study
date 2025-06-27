import 'dart:convert';

class MovieDataModel {
  final String jsonString = '''{
    "title": "Star Wars",
    "director": "George Lucas",
    "year": 1977
  }''';
}

class Movie {
  final String title;
  final String director;
  final int year;

  const Movie({
    required this.title,
    required this.director,
    required this.year,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: (json['title'] is String) ? json['title'] : '',
      director: (json['director'] is String) ? json['director'] : '',
      year: int.tryParse(json['year']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'year': year};
  }

  Movie copyWith({String? title, String? director, int? year}) {
    return Movie(
      title: title ?? this.title,
      director: director ?? this.director,
      year: year ?? this.year,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Movie &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            director == other.director &&
            year == other.year;
  }

  @override
  int get hashCode => title.hashCode ^ director.hashCode ^ year.hashCode;

  @override
  String toString() => 'Movie(title: $title, director: $director, year: $year)';
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(const Duration(seconds: 2));

  final movieData = MovieDataModel();
  final String jsonString = movieData.jsonString;

  final Map<String, dynamic> json = jsonDecode(jsonString);

  return Movie.fromJson(json);
}

Future<void> main() async {
  final Movie movie = await getMovieInfo();

  print('제목 : ${movie.title}\n감독 : ${movie.director}\n연도 : ${movie.year}');
  print(movie.toString());
}
