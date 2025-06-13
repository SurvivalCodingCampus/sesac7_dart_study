import 'package:modu_3_dart_study/250613/book.dart';
import 'package:test/test.dart';

void main() {
  test('Book클래스 weight get,set테스트', () {
    Book book = Book(
      weight: 100.0,
      name: 'cup',
      price: 2500,
      color: 'white',
      isbn: "123345030",
    );

    book.weight = 100.0;
    expect(book.weight, equals(100));
  });
}
