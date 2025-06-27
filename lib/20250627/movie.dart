import 'dart:convert';

class Movie {
  final String? title;
  final String? director;
  final int? year;

  Movie(this.title, this.director, this.year);

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

  Movie copyWith({String? title, String? director, int? year}) {
    return Movie(
      title ?? this.title,
      director ?? this.director,
      year ?? this.year,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'year': year};
  }

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'] ?? '',
      director = json['director'] ?? '',
      year = json['year'] ?? 0;

  @override
  String toString() {
    return 'Movie{title: $title, director: $director, year: $year}';
  }
}

Future<Movie> getMoviewInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final String jsonString = '''{
    "title" : "Star Ward",
    "director" : "George Lucas",
    "year" : 1977
  }''';

  final mapJson = jsonDecode(jsonString);
  final movie = Movie.fromJson(mapJson);

  return movie;
}

Future<Movie> getMoviewInfoToJson(String jsonString) async {
  await Future.delayed(Duration(seconds: 2));

  final mapJson = jsonDecode(jsonString);
  final movie = Movie.fromJson(mapJson);

  return movie;
}
