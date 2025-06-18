import 'package:modu_3_dart_study/book.dart';
import 'package:test/test.dart';

void main() {
  group('Book Test', () {
    test('생성자 테스트', () {
      // given
      final String testName = '셰익스피어';
      final int testPrice = 20000;
      final String testColor = '하얀색';
      final double testWeight = 10.0;
      final String testIsbn = 'book1';
      final Book book = Book(
        name: testName,
        price: testPrice,
        color: testColor,
        weight: testWeight,
        isbn: testIsbn,
      );

      // when & then
      expect(book.name, equals(testName));
      expect(book.price, equals(testPrice));
      expect(book.color, equals(testColor));
      expect(book.weight, equals(testWeight));
      expect(book.isbn, equals(testIsbn));
    });

    test('getter/setter 정상 작동 여부 테스트', () {
      // given
      final String testName1 = '셰익스피어';
      final String testName2 = '변신';
      final int testPrice1 = 20000;
      final int testPrice2 = 30000;
      final String testColor1 = '하얀색';
      final String testColor2 = '갈색';
      final double testWeight1 = 10.0;
      final double testWeight2 = 20.0;
      final String testIsbn1 = 'book1';
      final Book book = Book(
        name: testName1,
        price: testPrice1,
        color: testColor1,
        weight: testWeight1,
        isbn: testIsbn1,
      );

      // when & then
      // 값을 대입할 때 예외 없이 정상 작동하는지(setter),
      // 의도한 값이 그대로 들어갔는지(getter) 확인
      expect(() => book.name = testName2, returnsNormally);
      expect(book.name, equals(testName2));

      expect(() => book.price = testPrice2, returnsNormally);
      expect(book.price, equals(testPrice2));

      expect(() => book.color = testColor2, returnsNormally);
      expect(book.color, equals(testColor2));

      expect(() => book.weight = testWeight2, returnsNormally);
      expect(book.weight, equals(testWeight2));
    });

    test('책 무게는 0보다 커야 한다(형태가 있는 것이라면 무게가 있어야 한다)', () {
      // given
      final String testName = '셰익스피어';
      final int testPrice = 20000;
      final String testColor = '하얀색';
      final double testWeightInit = 10.0;
      final String testIsbn = 'book1';

      // 무게 경계값 설정
      final double testWeight1 = 0.001;
      final double testWeight2 = 0;
      final double testWeight3 = -0.001;

      final Book book = Book(
        name: testName,
        price: testPrice,
        color: testColor,
        weight: testWeightInit,
        isbn: testIsbn,
      );

      // when & then
      // 무게가 조금이라도 존재하면(0보다 조금이라도 크면) 정상 실행
      expect(() => book.weight = testWeight1, returnsNormally);
      expect(book.weight, equals(testWeight1));

      // 무게가 0 이하면 예외 처리
      expect(() => book.weight = testWeight2, throwsException);
      expect(() => book.weight = testWeight3, throwsException);
    });
  });
}
