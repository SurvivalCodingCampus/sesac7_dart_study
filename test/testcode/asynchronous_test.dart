import 'package:modu_3_dart_study/lecture_code/asynchronous/asynchronous.dart';
import 'package:test/test.dart';

void main() {
  test('description', () async {
    //given(준비)
    final String title = "StarWard";
    final String director = "George Lucas";
    final int year = 1977;

    //when(실행)
    final start = DateTime.now();
    Movie movie = await getMovieInfo();
    final end = DateTime.now();

    //then(검증)
    expect(end.difference(start) >= Duration(seconds: 2), true);
    expect(movie.title == title, true);
    expect(movie.director == director, true);
    expect(movie.year == year, true);
  });
}
