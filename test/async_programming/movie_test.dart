import 'package:modu_3_dart_study/async_programming/getMovieInfo.dart';
import 'package:modu_3_dart_study/async_programming/movie.dart';
import 'package:test/test.dart';

void main() {
  test('fromJson 정상 작동 여부 확인', () {
    // given
    final String testTitle = 'Star Ward';
    final String testName = 'George Lucas';
    final int testYear = 1977;
    final Map<String, dynamic> json = {
      'title': testTitle,
      'director': testName,
      'year': testYear,
    };

    final Movie testMovie = Movie.fromJson(json);

    // when & then
    expect(testMovie.title, equals(testTitle));
    expect(testMovie.director, equals(testName));
    expect(testMovie.year, equals(testYear));
  });

  test('getMovieInfo 리턴 값과 지연 시간 확인', () async {
    // given
    final String testTitle = 'Star Ward';
    final String testName = 'George Lucas';
    final int testYear = 1977;
    final int timeRange1 = 2000;
    final int timeRange2 = 2500;

    final DateTime startTime = DateTime.now(); // 시작 시간 기록
    final Movie testMovie = await getMovieInfo();
    final DateTime endTime = DateTime.now(); // 종료 시간 기록
    final Duration duration = endTime.difference(startTime); // 경과 시간 계산

    // when & then
    // 실행에 걸리는 시간이 2초가 맞는지? (오차 범위 제공)
    expect(duration.inMilliseconds, greaterThanOrEqualTo(timeRange1));
    expect(
      duration.inMilliseconds,
      lessThan(timeRange2), // 오차 제공
    );

    // Movie 객체를 잘 반환하고 각 필드 값이 잘 들어갔는지?
    expect(testMovie, isNotNull);
    expect(testMovie.title, equals(testTitle));
    expect(testMovie.director, equals(testName));
    expect(testMovie.year, equals(testYear));
  });
}
