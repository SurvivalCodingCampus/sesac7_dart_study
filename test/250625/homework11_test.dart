import 'package:modu_3_dart_study/250625/homework11.dart';
import 'package:test/test.dart';

void main() {
  test('runtime error발생 테스트', () {
    expect(() => intParse(numString: '11.1'), throwsA(isA<Exception>()));
    expect(() => intParse(numString: '11'), returnsNormally);
    expect(() => intParse(numString: '0.144'), throwsA(isA<Exception>()));
  });
}
