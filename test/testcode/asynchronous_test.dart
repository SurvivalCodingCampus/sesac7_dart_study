import 'package:modu_3_dart_study/lecture_code/asynchronous/asynchronous.dart';
import 'package:test/test.dart';

void main() {
  test('비동기 연습문제 1번 반환한 json 확인', () async {
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
    //external Duration difference(DateTime other);
    expect(movie.title == title, true);
    expect(movie.director == director, true);
    expect(movie.year == year, true);
  });
}
