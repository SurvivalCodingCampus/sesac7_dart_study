import 'dart:convert';

import 'package:modu_3_dart_study/13_async/movie.dart';

Future<Movie> getMovieInfo() async {
  // 2초동안 기다리는 코드 작성
  await Future.delayed(Duration(seconds: 2));

  // 서버에서 들어오는 데이터라고 상상
  final String jsonString = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }''';

  // Movie 데이터 클래스를 리턴하도록 작성
  try {
    return Movie.fromJson(jsonDecode(jsonString));
  } catch (e) {
    return Movie.fromJson({});
  }
}

void main() async {
  Movie movie = await getMovieInfo();

  print(movie.title);

  print(movie.toJson());
  print(jsonEncode(movie.toJson()));
}
