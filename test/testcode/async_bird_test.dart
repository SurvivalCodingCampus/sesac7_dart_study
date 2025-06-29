import 'package:modu_3_dart_study/lecture_code/asynchronous/async_bird.dart';
import 'package:test/test.dart';

void main() {
  test('비동기 연습문제 2번 각각 새소리 초 확인', () async {
    //given(준비)

    //when(실행)
    Stopwatch stopwatch = Stopwatch()..start();
    await Future.wait(Birds.values.map((b) => b.twitter()));
    print(stopwatch.elapsed);

    //then(검증)
    expect(stopwatch.elapsed.inSeconds, greaterThanOrEqualTo(12));
    expect(stopwatch.elapsed.inSeconds, lessThan(13));
  });
}
