import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Cleric Test', () {
    Cleric cleric = new Cleric('성직자', 50, 50, 10, 10);

    expect(cleric.name, equals('성직자'));
    expect(cleric.hp, equals(50));
    expect(cleric.maxHp, equals(50));
    expect(cleric.mp, equals(10));
    expect(cleric.maxMp, equals(10));
  });
}