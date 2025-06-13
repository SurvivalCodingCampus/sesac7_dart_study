import 'package:modu_3_dart_study/assignments/book.dart';
import 'package:modu_3_dart_study/assignments/computer.dart';
import 'package:test/test.dart';

void main() {
  group('Book 클래스 테스트', () {
    test('생성자 동작 테스트', () {
      final book = Book(
        300,
        name: 'Dart Book',
        price: 15000,
        color: 'blue',
        isbn: '978-1234567890',
      );

      expect(book.name, equals('Dart Book'));
      expect(book.price, equals(15000));
      expect(book.color, equals('blue'));
      expect(book.isbn, equals('978-1234567890'));
      expect(book.weight, equals(300));
    });

    test('weight setter 정상 동작', () {
      final book = Book(
        200,
        name: 'A',
        price: 1000,
        color: 'gray',
        isbn: 'xxx',
      );
      book.weight = 400;
      expect(book.weight, 400);
    });

    test('음수 weight 설정 시 예외 발생', () {
      final book = Book(
        100,
        name: 'A',
        price: 1000,
        color: 'gray',
        isbn: 'xxx',
      );
      expect(() => book.weight = -1, throwsException);
    });

    test('price setter 정상 동작', () {
      final book = Book(
        200,
        name: 'A',
        price: 1000,
        color: 'gray',
        isbn: 'xxx',
      );
      book.price = 5000;
      expect(book.price, 5000);
    });

    test('음수 price 설정 시 예외 발생', () {
      final book = Book(
        100,
        name: 'A',
        price: 1000,
        color: 'gray',
        isbn: 'xxx',
      );
      expect(() => book.price = -100, throwsException);
    });
  });

  group('Computer 클래스 테스트', () {
    test('생성자 동작 및 필드 확인', () {
      final computer = Computer(
        1500,
        name: 'MacBook Air',
        price: 1800000,
        color: 'space gray',
        makerName: 'Apple',
      );

      expect(computer.name, 'MacBook Air');
      expect(computer.price, 1800000);
      expect(computer.color, 'space gray');
      expect(computer.makerName, 'Apple');
      expect(computer.weight, 1500);
    });

    test('makerName 필드 변경 가능 여부', () {
      final computer = Computer(
        1500,
        name: 'Galaxy Book Pro',
        price: 2000000,
        color: 'black',
        makerName: 'Samsung',
      );

      computer.makerName = 'Samsung';
      expect(computer.makerName, 'Samsung');
    });

    test('음수 weight 설정 시 예외 발생 (상속 확인)', () {
      final computer = Computer(
        1000,
        name: 'LG Gram',
        price: 1600000,
        color: 'white',
        makerName: 'LG',
      );

      expect(() => computer.weight = -500, throwsException);
    });
  });
}
