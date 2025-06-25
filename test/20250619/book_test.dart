import 'package:modu_3_dart_study/20250619/book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('정렬, copyWith 테스트', ()
  {
    late Book book1, book2, book3, book4, book5;
    setUp((){
      book1 = Book(title: '체육', comment: '힘든책', publishDate: DateTime(2024, 1, 1));
      book2 = book1.copyWith(title: '영어', comment: '졸린책', publishDate: DateTime(2025, 2, 1));
      book3 = Book(title: '가정', comment: '따분한책');
      book4 = Book(title: '체육', comment: '재밌는책', publishDate: DateTime(2024, 1, 1));
      book5 = book1.deepCopy();
    });
    test('제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다', () {
      expect(book1 == book4, true);
    });
    test('Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.', () {
      final List<Book> books = [book1, book2, book3, book4, book5];
      books.sort();

      expect(books[0].title == '가정' && books[0].comment == '따분한책', true);
      expect(books[4].title == '체육' && books[4].comment == '힘든책', true);
    });
    // 루프를 이용한 테스트 추가
    test('Book 정렬 순서를 루프로 검증한다.', () {
      final List<Book> books = [book1, book2, book3, book4, book5];
      books.sort();

      for (int i = 0; i < books.length - 1; i++) {
        expect(books[i+1].publishDate.isBefore(books[i].publishDate) ||
            books[i+1].publishDate.isAtSameMomentAs(books[i].publishDate), isTrue);
      }
    });
    test('copyWith() 메서드를 제공한다 (깊은 복사)', () {
      expect(book1.title == book5.title, true);
      expect(book1.comment == book5.comment, true);
      expect(book1.publishDate == book5.publishDate, true);
      expect(identical(book1, book5), false);
    });
  });

}