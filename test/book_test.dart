import 'package:modu_3_dart_study/book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Book 클래스 테스트', () {
    final String testName = '';
    final int testPrice = 0;
    final String testColor = '';
    final String testIsbn = '';
    final double testWeight = 0.0;
    final book = Book(
      name: testName,
      price: testPrice,
      color: testColor,
      isbn: testIsbn,
      weight: testWeight,
    );

    test('weight의 getter, setter 테스트', () {
      final double getWeight = book.weight;
      final double setWeight = 1.0;

      expect(book.weight == getWeight, equals(true));

      book.weight = setWeight;

      expect(book.weight == getWeight, equals(false));
      expect(book.weight == setWeight, equals(true));
    });
  });
}
