import 'package:modu_3_dart_study/assignments/2025-06-13/book.dart';
import 'package:test/test.dart';

void main() {
  group('Book 테스트', () {
    final bookName = '플러터 생존코딩';
    final bookPrice = 25200;
    final bookColor = 'white';
    final bookWeight = 100.0;
    final bookIsbn = '한빛미디어';
    final changeBookWeight = 80.0;
    test('Book 생성자 테스트', () {
      Book book = Book(
        100.0,
        name: '플러터 생존코딩',
        price: 25200,
        color: 'white',
        isbn: '한빛미디어',
      );
      expect(book.name, bookName);
      expect(book.price, bookPrice);
      expect(book.color, bookColor);
      expect(book.weight, bookWeight);
      expect(book.isbn, bookIsbn);
    });

    test('Book setter 테스트', () {
      Book book = Book(
        100.0,
        name: '플러터 생존코딩',
        price: 25200,
        color: 'white',
        isbn: '한빛미디어',
      );
      book.weight = 80.0;
      expect(book.weight, changeBookWeight);
    });
  });
}
