import 'dart:convert';

import 'package:modu_3_dart_study/assignments/movie/movie.dart';

final jsonString = '''{
"title": "Star Ward",
"director": "George Lucas",
"year": 1977
}''';

void main() async {
  final movie = await getMovieInfo();
  print(movie.title);
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  return Movie.fromJson(jsonDecode(jsonString));
}
