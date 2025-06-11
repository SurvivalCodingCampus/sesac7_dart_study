import 'package:modu_3_dart_study/wand.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Given Wand class When 인스턴스 생성 이후에 지팡이의 이름을 2문자 이하로 설정하는 경우 then 예외 발생',
    () {
      // given(준비)
      Wand myWand = Wand('엄청난 지팡이', 10);
      // when (실행)
      // myWand.setName = '힘찬';
      // then (검증)
      expect(() => myWand.setName = '힘찬', throwsException);
    },
  );

  test(
    'Given Wand class When 인스턴스 생성 이후에 지팡이의 마력을 0.5 미만으로 설정하는 경우 then 예외 발생',
    () {
      // given(준비)
      Wand myWand = Wand('엄청난 지팡이', 10);
      // when (실행)
      // myWand.setPower = 0.3;
      // then (검증)
      expect(() => myWand.setPower = 0.3, throwsException);
    },
  );

  test(
    'Given Wand class When 인스턴스 생성 이후에 지팡이의 마력을 100을 초과하여 설정하는 경우 then 예외 발생',
    () {
      // given(준비)
      Wand myWand = Wand('엄청난 지팡이', 10);
      // when (실행)
      // myWand.setPower = 105;
      // then (검증)
      expect(() => myWand.setPower = 105, throwsException);
    },
  );
}
