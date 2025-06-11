import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-11/wand.dart';
import 'package:modu_3_dart_study/assignments/2025-06-11/wizard.dart';

void main() {
  group('Constructor tests', () {
    test('Wand instance', () {
      Wand woodwand = Wand('woodwand', 1.0);

      expect(woodwand.name, 'woodwand');
      expect(woodwand.power, 1.0);
    });

    test('Wizard instance', () {
      Wand woodwand = Wand('woodwand', 1.0);
      Wizard harry = Wizard('Harry', 10, wand: woodwand);

      expect(harry.name, 'Harry');
      expect(harry.hp, 10);
      expect(harry.wand, woodwand);
      expect(harry.wand!.name, 'woodwand');
      expect(harry.wand!.power, 1.0);
    });
  });

  group('Wand setter tests', () {
    test('Wand name setter', () {
      Wand woodwand = Wand('woodwand', 1.0);

      //set name to 'ww', violation of >3 rule.
      expect(() => {woodwand.name = 'ww'}, throwsException);
      //set name to 'MithrilWand', should work fine.
      expect(() => {woodwand.name = 'MithrilWand'}, returnsNormally);

      //now actually change the name
      woodwand.name = 'MithrilWand';

      //see if the change is there
      expect(woodwand.name, 'MithrilWand');
    });

    test('Wand power setter', () {
      Wand woodwand = Wand('woodwand', 1.0);

      //set power to 0.4, violation of > 0.5 rule.
      expect(() => {woodwand.power = 0.4}, throwsException);
      //set power to 200.0, violation of < 100.0 rule.
      expect(() => {woodwand.power = 200.0}, throwsException);
      //set power to 42.5, should work fine.
      expect(() => {woodwand.power = 42.5}, returnsNormally);

      //now actually change the power
      woodwand.power = 2.0;

      //see if the change is there
      expect(woodwand.power, 2.0);
    });

    test('Wizard setters', () {
      Wand woodwand = Wand('woodwand', 1.0);
      Wizard harry = Wizard('Harry', 10, wand: woodwand);

      //cannot set wand to null
      expect(() => {harry.wand = null}, throwsException);
      //cannot set name to length <3
      expect(() => {harry.name = 'ha'}, throwsException);

      //try setting hp to 20;
      harry.hp = 20;
      expect(harry.hp, 20);

      //try setting hp to -1;
      harry.hp = -1;
      expect(harry.hp, 0);
    });
  });
}
