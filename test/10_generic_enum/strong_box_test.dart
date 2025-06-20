import 'package:modu_3_dart_study/10_generic_enum/key_type.dart';
import 'package:modu_3_dart_study/10_generic_enum/strong_box.dart';
import 'package:modu_3_dart_study/game_jrpg/hero.dart';
import 'package:modu_3_dart_study/game_jrpg/slime.dart';
import 'package:modu_3_dart_study/game_jrpg/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('StrongBox 테스트', () {
    final padlock = KeyType.padlock;
    final button = KeyType.button;
    final dial = KeyType.dial;
    final finger = KeyType.finger;
    final int padlockCount = 1024;
    final int buttonCount = 10000;
    final int dialCount = 30000;
    final int fingerCount = 1000000;
    final nullValue = null;

    test('StrongBox KeyType padlock 테스트', () {
      final testInstance1 = Hero(name: '홍기동');
      final strongBox1 = StrongBox(keyType: KeyType.padlock);

      strongBox1.put(testInstance1);

      for (int i = 0; i <= padlockCount; i++) {
        expect(strongBox1.keyType == padlock, equals(true));

        if (i != padlockCount) {
          expect(strongBox1.count < padlockCount, equals(true));
          expect(strongBox1.get() == nullValue, equals(true));
        } else {
          expect(strongBox1.count == padlockCount, equals(true));
          expect(strongBox1.get() == testInstance1, equals(true));
        }
      }
    });

    test('StrongBox KeyType button 테스트', () {
      final testInstance2 = Wizard(name: '홍', hp: 100);
      final strongBox2 = StrongBox(keyType: KeyType.button);

      strongBox2.put(testInstance2);

      for (int i = 0; i <= buttonCount; i++) {
        expect(strongBox2.keyType == button, equals(true));

        if (i != buttonCount) {
          expect(strongBox2.count < buttonCount, equals(true));
          expect(strongBox2.get() == nullValue, equals(true));
        } else {
          expect(strongBox2.count == buttonCount, equals(true));
          expect(strongBox2.get() == testInstance2, equals(true));
        }
      }
    });

    test('StrongBox KeyType dial 테스트', () {
      final testInstance3 = Slime('A');
      final strongBox3 = StrongBox(keyType: KeyType.dial);

      strongBox3.put(testInstance3);

      for (int i = 0; i <= dialCount; i++) {
        expect(strongBox3.keyType == dial, equals(true));

        if (i != dialCount) {
          expect(strongBox3.count < dialCount, equals(true));
          expect(strongBox3.get() == nullValue, equals(true));
        } else {
          expect(strongBox3.count == dialCount, equals(true));
          expect(strongBox3.get() == testInstance3, equals(true));
        }
      }
    });

    test('StrongBox KeyType finger 테스트', () {
      final testInstance4 = '랜덤 인스턴스';
      final strongBox4 = StrongBox(keyType: KeyType.finger);

      strongBox4.put(testInstance4);

      for (int i = 0; i <= fingerCount; i++) {
        expect(strongBox4.keyType == finger, equals(true));

        if (i != fingerCount) {
          expect(strongBox4.count < fingerCount, equals(true));
          expect(strongBox4.get() == nullValue, equals(true));
        } else {
          expect(strongBox4.count == fingerCount, equals(true));
          expect(strongBox4.get() == testInstance4, equals(true));
        }
      }
    });
  });
}
