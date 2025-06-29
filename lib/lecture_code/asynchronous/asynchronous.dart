// 다음과 같은 영화 정보 Json 을 반환하는 함수가 있다. (async - await 사용할 것)

import 'dart:convert';

class Movie {
  final String title;
  final String director;
  final int year;

  Movie({required this.title, required this.director, required this.year});

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'year': year};
  }

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      year = json['year'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          director == other.director &&
          year == other.year;

  @override
  int get hashCode => title.hashCode ^ director.hashCode ^ year.hashCode;

  Movie copyWith({
    String? title,
    String? director,
    int? year,
  }) {
    return Movie(
      title: title ?? this.title,
      director: director ?? this.director,
      year: year ?? this.year,
    );
  }
}

Future<Movie> getMovieInfo() async {
  final String jsonString =
      '''{"title": "StarWard", "director": "George Lucas", "year": 1977}''';
  Map<String, dynamic> json = jsonDecode(jsonString);
  Movie movie = Movie.fromJson(json);
  return await Future.delayed(Duration(seconds: 2), () => movie);
}
