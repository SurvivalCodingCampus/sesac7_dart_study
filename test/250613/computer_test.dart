import 'package:modu_3_dart_study/250613/computer.dart';
import 'package:test/test.dart';

void main() {
  test('Computer클래스 weight get,set테스트', () {
    Computer computer = Computer(
      weight: 100.0,
      name: '맥북프로',
      price: 250000000,
      color: 'black',
      makerName: '애플',
    );

    computer.weight = 90.0;
    expect(computer.weight, equals(90));
  });
}
