import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-04/cleric.dart';

void main() {

  group('Question 1 : Cleric Class', () {
    test('Cleric class initial value Test', () {
      // given (준비)
      final clericJang = Cleric('Jang');

      // when (실행)

      // then (검증)
      expect(clericJang.name, equals('Jang'));
      expect(clericJang.hp, equals(50));
      expect(clericJang.maxHp, equals(50));
      expect(clericJang.mp, equals(10));
      expect(clericJang.maxMp, equals(10));
    });
  });

  group('Question 2 : Cleric selfAid()', () {
    test('selfAid() method when 20/50 hp, 10/10 mp', () {

      // given (준비)
      final clericJang = Cleric('Jang');

      // case 1 : 반피, 풀마나 -> 정상사용가능
      // when (실행)
      clericJang.hp = 20;
      clericJang.mp = 10;
      clericJang.selfAid();

      // then (검증)
      // 마나를 5 소모해서 풀피로 회복했다.
      expect(clericJang.hp, equals(clericJang.maxHp));
      expect(clericJang.mp, equals(5));
    });

    test('selfAid() method when 50/50 hp, 10/10 mp', () {

      // given (준비)
      final clericJang = Cleric('Jang');

      // case 2 : 풀피, 풀마나 -> 정상사용 가능? might depends on ingame rule set but okay
      // when (실행)
      clericJang.hp = clericJang.maxHp;
      clericJang.mp = clericJang.maxMp;
      clericJang.selfAid();

      // then (검증)
      // 마나를 5 소모해서 풀피로 회복했다.
      expect(clericJang.hp, equals(clericJang.maxHp));
      expect(clericJang.mp, equals(5));

    });

    test('selfAid() method when 20/50 hp, 1/10 mp', () {

      // given (준비)
      final clericJang = Cleric('Jang');

      // case 3 : 반피, 노마나 -> 사용 불가능, 마나가 부족해요
      // when (실행)
      clericJang.hp = 20;
      clericJang.mp = 1;
      clericJang.selfAid();

      //then (검증)
      //마나는 그대로, 체력도 그대로.
      expect(clericJang.hp, equals(20));
      expect(clericJang.mp, equals(1));

    });
      
  });

  group('Question 3 : Cleric pray()', () {
    test('pray() method when 2/10 mp, 2 seconds', () {
      // given (준비)
      final clericJang = Cleric('Jang');
      int retval = 0;

      const int testIterations = 10;
      // random is involved, test 10 times
      for (var i = 0; i < testIterations; i++) {
        print('Iteration #${i+1}');
        // case 1 : 2/10 mp + 2seconds (2~4) = 4~6
        // when (실행)
        clericJang.mp = 2;
        retval = clericJang.pray(2);

        // then (검증)
        // mp 는 2부터 6사이가 되야합니다
        expect(clericJang.mp >= 4, equals(true));
        expect(clericJang.mp <= 6, equals(true));
        // 리턴밸류 회복량은 2부터 4가 되야합니다.
        expect(retval >= 2, equals(true));
        expect(retval <= 4, equals(true));
      }
    });

    test('pray() method when 2/10 mp, 0 seconds', () {
      // given (준비)
      final clericJang = Cleric('Jang');
      int retval = 0;

      // when (실행)
      clericJang.mp = 2;
      retval = clericJang.pray(0);


      // then (검증)
      // mp 는 그대로 2입니다.
      expect(clericJang.mp, equals(2));
      expect(retval, equals(0));
      
    });

    test('pray() method when 6/10 mp, 3 seconds', () {
      // given (준비)
      final clericJang = Cleric('Jang');
      int retval = 0;

      const int testIterations = 10;
      // random is involved, test 10 times
      for (var i = 0; i < testIterations; i++) {
        print('Iteration #${i+1}');
        // case 1 : 6/10 mp + 3seconds (3~5) = 9~11
        // when (실행)
        clericJang.mp = 6;
        retval = clericJang.pray(3);

        // then (검증)
        // mp 는 9부터 10사이가 되야합니다. 최대마나 10을 넘으면 안되니까 11은 안됩니다.
        expect(clericJang.mp >= 9, equals(true));
        expect(clericJang.mp <= 10, equals(true));
        expect(clericJang.mp != 11, equals(true));
        // 리턴밸류 회복량은 3부터 4가 되야합니다. 최대마나 10을 넘으면 안되니까 5는 안됩니다.
        expect(retval >= 3, equals(true));
        expect(retval <= 4, equals(true));
        expect(retval != 5, equals(true));
      }
    });
  });
}
