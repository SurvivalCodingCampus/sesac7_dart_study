import 'dart:convert';

void main() async {
  Movie movieInfo = await getMovieInfo();
  print(movieInfo.title);
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }''';

  final data = jsonDecode(jsonString);

  // Movie movie = Movie(
  //   title: data['title'],
  //   director: data['director'],
  //   year: data['year'],
  // );

  Movie movie = Movie.fromJson(data);

  return movie;
}

class Movie {
  final String title;
  final String director;
  final int year;

  Movie({
    required this.title,
    required this.director,
    required this.year,
  });

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      year = json['year'];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "director": director,
      "year": year,
    };
  }
}
