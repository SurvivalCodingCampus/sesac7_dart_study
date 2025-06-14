import 'package:modu_3_dart_study/asset/book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('BookClass Test', () {
    test('Book 클래스 생성자 테스트', () {
      final String testBookName = 'TestBook';
      final int testBookPrice = 10000;
      final String testBookColor = 'Brown';
      final String testBookTexture = 'Paper';
      final String testBookIsbn = 'ISBN 000-00-00000-00-0';
      final bool testBookSealed = false;
      final double testBookWeight = 10;
      final double testBookWidth = 15;
      final double testBookHeight = 25;
      final double testBookDepth = 5;
      final Book book = Book(
        name: testBookName,
        price: testBookPrice,
        color: testBookColor,
        texture: testBookTexture,
        isbn: testBookIsbn,
        isSealed: testBookSealed,
        weight: testBookWeight,
        tangibleAssetWidth: testBookWidth,
        tangibleAssetHeight: testBookHeight,
        tangibleAssetDepth: testBookDepth,
      );

      expect(book.name, equals(testBookName));
      expect(book.price, equals(testBookSealed ? testBookPrice + book.sealPrice : testBookPrice - book.sealPrice));
      expect(book.color, equals(testBookColor));
      expect(book.texture, equals(testBookTexture));
      expect(book.isbn, equals(testBookIsbn));
      expect(book.weight, equals(testBookWeight));
      expect(book.tangibleAssetWidth, equals(testBookWidth));
      expect(book.tangibleAssetHeight, equals(testBookHeight));
      expect(book.tangibleAssetDepth, equals(testBookDepth));
    });
    test('BookClass implements 변수 getter / setter 테스트', () {
      final String testBookName = 'TestBook';
      final int testBookPrice = 10000;
      final String testBookColor = 'Brown';
      final String testBookTexture = 'Paper';
      final String testBookIsbn = 'ISBN 000-00-00000-00-0';
      final bool testBookSealed = false;
      final double testBookWeight = 10;
      final double testBookWidth = 15;
      final double testBookHeight = 25;
      final double testBookDepth = 5;
      final Book book = Book(
        name: testBookName,
        price: testBookPrice,
        color: testBookColor,
        texture: testBookTexture,
        isbn: testBookIsbn,
        isSealed: testBookSealed,
        weight: testBookWeight,
        tangibleAssetWidth: testBookWidth,
        tangibleAssetHeight: testBookHeight,
        tangibleAssetDepth: testBookDepth,
      );

      /* Setter */
      book.weight = 50;
      book.tangibleAssetWidth = 20;
      book.tangibleAssetHeight = 40;
      book.tangibleAssetDepth = 60;

      /* Getter */
      expect(book.weight, equals(50));
      expect(book.tangibleAssetWidth, equals(20));
      expect(book.tangibleAssetHeight, equals(40));
      expect(book.tangibleAssetDepth, equals(60));
    });
    group('Book 클래스 추상 메서드 adjustValue 구현부 테스트', () {
      test('생성자 isSealed false 생성시 생성자 블럭 adjustValue 호출 price 값 감소 테스트', () {
        final String testBookName = 'TestBook';
        final int testBookPrice = 10000;
        final String testBookColor = 'Brown';
        final String testBookTexture = 'Paper';
        final String testBookIsbn = 'ISBN 000-00-00000-00-0';
        final bool testBookSealed = false;
        final double testBookWeight = 10;
        final double testBookWidth = 15;
        final double testBookHeight = 25;
        final double testBookDepth = 5;
        final Book book = Book(
          name: testBookName,
          price: testBookPrice,
          color: testBookColor,
          texture: testBookTexture,
          isbn: testBookIsbn,
          isSealed: testBookSealed,
          weight: testBookWeight,
          tangibleAssetWidth: testBookWidth,
          tangibleAssetHeight: testBookHeight,
          tangibleAssetDepth: testBookDepth,
        );

        expect(testBookPrice - book.sealPrice, equals(book.price));
      });
      test('생성자 isSealed true 생성시 생성자 블럭 adjustValue 호출 price 값 증가 테스트', () {
        final String testBookName = 'TestBook';
        final int testBookPrice = 10000;
        final String testBookColor = 'Brown';
        final String testBookTexture = 'Paper';
        final String testBookIsbn = 'ISBN 000-00-00000-00-0';
        final bool testBookSealed = true;
        final double testBookWeight = 10;
        final double testBookWidth = 15;
        final double testBookHeight = 25;
        final double testBookDepth = 5;
        final Book book = Book(
          name: testBookName,
          price: testBookPrice,
          color: testBookColor,
          texture: testBookTexture,
          isbn: testBookIsbn,
          isSealed: testBookSealed,
          weight: testBookWeight,
          tangibleAssetWidth: testBookWidth,
          tangibleAssetHeight: testBookHeight,
          tangibleAssetDepth: testBookDepth,
        );

        expect(testBookPrice + book.sealPrice, equals(book.price));
      });
      test('isSealed false 생성 후 isSealed true 변경시 price 증가 테스트', () {
        final String testBookName = 'TestBook';
        final int testBookPrice = 10000;
        final String testBookColor = 'Brown';
        final String testBookTexture = 'Paper';
        final String testBookIsbn = 'ISBN 000-00-00000-00-0';
        final bool testBookSealed = false;
        final double testBookWeight = 10;
        final double testBookWidth = 15;
        final double testBookHeight = 25;
        final double testBookDepth = 5;
        final Book book = Book(
          name: testBookName,
          price: testBookPrice,
          color: testBookColor,
          texture: testBookTexture,
          isbn: testBookIsbn,
          isSealed: testBookSealed,
          weight: testBookWeight,
          tangibleAssetWidth: testBookWidth,
          tangibleAssetHeight: testBookHeight,
          tangibleAssetDepth: testBookDepth,
        );

        book.isSealed = true;

        expect(testBookPrice + book.sealPrice, equals(book.price));
      });
      test('isSealed true 생성 후 isSealed false 변경시 price 감소 테스트', () {
        final String testBookName = 'TestBook';
        final int testBookPrice = 10000;
        final String testBookColor = 'Brown';
        final String testBookTexture = 'Paper';
        final String testBookIsbn = 'ISBN 000-00-00000-00-0';
        final bool testBookSealed = true;
        final double testBookWeight = 10;
        final double testBookWidth = 15;
        final double testBookHeight = 25;
        final double testBookDepth = 5;
        final Book book = Book(
          name: testBookName,
          price: testBookPrice,
          color: testBookColor,
          texture: testBookTexture,
          isbn: testBookIsbn,
          isSealed: testBookSealed,
          weight: testBookWeight,
          tangibleAssetWidth: testBookWidth,
          tangibleAssetHeight: testBookHeight,
          tangibleAssetDepth: testBookDepth,
        );

        book.isSealed = false;

        expect(testBookPrice - book.sealPrice, equals(book.price));
      });
    });
  });
}
