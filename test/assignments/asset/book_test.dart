import 'package:modu_3_dart_study/assignments/asset/book.dart';
import 'package:modu_3_dart_study/assignments/asset/thing.dart';
import 'package:test/test.dart';

void main() {
  const String name = 'Book';
  const int price = 10000;
  const String color = 'Black';
  const String isbn = 'isbn';
  const double weight = 100;

  late Book book;

  setUp(() {
    book = Book(name, price: price, color: color, isbn: isbn, weight: weight);
  });

  group('constructor', () {
    test(
      'When a book is created with name, price, color, isbn, and weight, it contains the given values.',
      () {
        // given
        // when

        // then
        expect(book.name, name);
        expect(book.price, price);
        expect(book.color, color);
        expect(book.isbn, isbn);
        expect(book.weight, weight);
      },
    );
  });

  group('weight', () {
    test('Throws an exception if the weight is less than zero.', () {
      // given
      final lessThanZero = Thing.minWeight - 1;

      // when
      // then
      expect(() => book.weight = lessThanZero, throwsException);
    });

    test('If the weight is greater than zero, it has that value.', () {
      // given
      final moreThanZero = Thing.minWeight + 1;

      // when
      book.weight = moreThanZero;

      // then
      expect(book.weight, moreThanZero);
    });
  });
}
