import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-25/key_type.dart';
import 'package:modu_3_dart_study/assignments/2025-06-25/strong_box.dart';

void main() {
  group('GROUP : StrongBox tests\n', () {
    test('Set and get try: padlock', () {
      //given
      final StrongBox<String> box = StrongBox(KeyType.padlock);
      final int padlockMax = box.maxTrials[KeyType.padlock]!;
      expect(box.get(), null);
      //when
      box.set("Secret Map");
      box.set("Different Map");
      //then
      for (int i = 0; i < padlockMax; i++) {
        // 1024 is the StrongBox._maxTrials[padlock]
        expect(box.get(), null);
      }
      expect(box.get(), "Secret Map");
    });
    test('Set and get try: button', () {
      //given
      final StrongBox<String> box = StrongBox(KeyType.button);
      final int buttonMax = box.maxTrials[KeyType.button]!;
      expect(box.get(), null);
      //when
      box.set("Secret Map");
      box.set("Different Map");
      //then
      for (int i = 0; i < buttonMax; i++) {
        // 10000 is the StrongBox._maxTrials[button]
        expect(box.get(), null);
      }
      expect(box.get(), "Secret Map");
    });
    test('Set and get try: dial', () {
      //given
      final StrongBox<String> box = StrongBox(KeyType.dial);
      final int dialMax = box.maxTrials[KeyType.dial]!;
      expect(box.get(), null);
      //when
      box.set("Secret Map");
      box.set("Different Map");
      //then
      for (int i = 0; i < dialMax; i++) {
        // 30000 is the StrongBox._maxTrials[dial]
        expect(box.get(), null);
      }
      expect(box.get(), "Secret Map");
    });
    test('Set and get try: finger', () {
      //given
      final StrongBox<String> box = StrongBox(KeyType.finger);
      final int fingerMax = box.maxTrials[KeyType.finger]!;
      expect(box.get(), null);
      //when
      box.set("Secret Map");
      box.set("Different Map");
      //then
      for (int i = 0; i < fingerMax; i++) {
        // 1_000_000 is the StrongBox._maxTrials[finger]
        expect(box.get(), null);
      }
      expect(box.get(), "Secret Map");
    });
  });
}
