import 'package:modu_3_dart_study/assignments/2025-06-05/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('Cleric Test', () {
    test('Cleric 생성자 테스트1', () {
      //Clelic클래스의 hp,mp의 초기값은 각각 50,10

      //name,hp,mp의 인자를 모두 준 경우.
      Cleric cleric = Cleric('아서스', hp: 30, mp: 10);

      expect(cleric.name, '아서스');
      expect(cleric.hp, 30);
      expect(cleric.mp == 10, true);
    });


    test('Cleric 생성자 테스트2', () {
      //name,hp만 인자로 준 경우.
      //이떄 mp는 maxMp값인 10 예상.

      final int maxMp = Cleric.maxMp;
      Cleric cleric = Cleric('아서스', hp: 30);

      expect(cleric.name, '아서스');
      expect(cleric.hp == 30, true);
      expect(cleric.mp == maxMp, true);
    });


    test('Cleric 생성자 테스트3', () {
      //name만 인자로 준 경우.
      //이때 hp는 maxHp값인 50 예상.
      //이때 mp는 maxMp값인 10 예상.

      final int maxHp = Cleric.maxHp;
      final int maxMp = Cleric.maxMp;

      Cleric cleric = Cleric('아서스');

      expect(cleric.name, '아서스');
      expect(cleric.hp == maxHp, true);
      expect(cleric.mp, equals(maxMp));
    });
  });
}