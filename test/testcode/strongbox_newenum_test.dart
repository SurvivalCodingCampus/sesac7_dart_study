import 'package:modu_3_dart_study/lecture_code/generic/strongbox_newenum.dart';
import 'package:test/test.dart';

void main() {
  group('제네릭 열거형 연습문제 2 ', () {
    test('padlock 한도횟수 Test', () {
      //given(준비)
      StrongBox<Lock> padlock = StrongBox<Lock>(KeyType.padlock);
      padlock.put(padlock.lock);

      //when(실행)
      for (int i = 1; i < KeyType.padlock.limitNum; i++) {
        padlock.get();
      }

      //then(검증)
      expect(padlock.get() != null, true);
    });

    test('button 한도횟수 Test', () {
      //given(준비)
      StrongBox<Lock> button = StrongBox<Lock>(KeyType.button);
      button.put(button.lock);

      //when(실행)
      for (int i = 1; i < KeyType.button.limitNum; i++) {
        button.get();
      }

      //then(검증)
      expect(button.get() != null, true);
    });

    test('dial 한도횟수 Test', () {
      //given(준비)
      StrongBox<Lock> dial = StrongBox<Lock>(KeyType.dial);
      dial.put(dial.lock);

      //when(실행)
      for (int i = 1; i < KeyType.dial.limitNum; i++) {
        dial.get();
      }

      //then(검증)
      expect(dial.get() != null, true);
    });

    test('finger 한도횟수 Test', () {
      //given(준비)
      StrongBox<Lock> finger = StrongBox<Lock>(KeyType.finger);
      finger.put(finger.lock);

      //when(실행)
      for (int i = 1; i < KeyType.finger.limitNum; i++) {
        finger.get();
      }

      //then(검증)
      expect(finger.get() != null, true);
    });
  });
}
