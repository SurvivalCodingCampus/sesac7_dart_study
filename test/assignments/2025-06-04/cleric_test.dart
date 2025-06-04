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

}
