import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/09_object/book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Book 클래스 인스턴스 기본 조작 테스트', () {
    final bookName1 = '해리포터1';
    final bookComment1 = '신간3';
    final bookPublishDate1 = DateTime(2025, 6, 19);
    final bookName2 = '반지의제왕1';
    final bookComment2 = '신간5';
    final bookPublishDate2 = DateTime(1999, 6, 5);
    final bookName3 = '해리포터2';
    final bookComment3 = '신간6';
    final bookPublishDate3 = DateTime(1709, 4, 5);
    final bookName4 = '해리포터3';
    final bookComment4 = '신간1';
    final bookPublishDate4 = DateTime(2059, 9, 15);
    final bookName5 = '해리포터4';
    final bookComment5 = '신간4';
    final bookPublishDate5 = DateTime(2018, 3, 2);
    final bookName6 = '해리포터5';
    final bookComment6 = '신간2';
    final bookPublishDate6 = DateTime(2025, 7, 5);

    final book1 = Book(
      title: bookName1,
      comment: bookComment1,
      publishDate: bookPublishDate1,
    );
    final book1Copy = Book(
      title: bookName1,
      comment: bookComment1,
      publishDate: bookPublishDate1,
    );
    final book2 = Book(
      title: bookName2,
      comment: bookComment2,
      publishDate: bookPublishDate2,
    );
    final book3 = Book(
      title: bookName3,
      comment: bookComment3,
      publishDate: bookPublishDate3,
    );
    final book4 = Book(
      title: bookName4,
      comment: bookComment4,
      publishDate: bookPublishDate4,
    );
    final book5 = Book(
      title: bookName5,
      comment: bookComment5,
      publishDate: bookPublishDate5,
    );
    final book6 = Book(
      title: bookName6,
      comment: bookComment6,
      publishDate: bookPublishDate6,
    );

    test('제목과 출간일이 같으면 같은 책으로 판단', () {
      expect(book1.title == book1Copy.title, equals(true));
      expect(book1.publishDate == book1Copy.publishDate, equals(true));
      expect(book1 == book1Copy, equals(true));

      expect(book1.title == book2.title, equals(false));
      expect(book1.publishDate == book2.publishDate, equals(false));
      expect(book1 == book2, equals(false));
    });

    test('Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 테스트', () {
      final String newBook1 = bookComment4;
      final String newBook2 = bookComment6;
      final String newBook3 = bookComment1;
      final String newBook4 = bookComment5;
      final String newBook5 = bookComment2;
      final String newBook6 = bookComment3;

      final List<Book> books = [book1, book2, book3, book4, book5, book6];
      final List<Book> sortedBooks = books.sorted((a, b) => a.compareTo(b));

      expect(books[0] == book1, equals(true));
      expect(books[1] == book2, equals(true));
      expect(books[2] == book3, equals(true));
      expect(books[3] == book4, equals(true));
      expect(books[4] == book5, equals(true));
      expect(books[5] == book6, equals(true));

      expect(sortedBooks[0].comment, equals(newBook1));
      expect(sortedBooks[1].comment, equals(newBook2));
      expect(sortedBooks[2].comment, equals(newBook3));
      expect(sortedBooks[3].comment, equals(newBook4));
      expect(sortedBooks[4].comment, equals(newBook5));
      expect(sortedBooks[5].comment, equals(newBook6));
    });

    test('Book copyWith() 깊은 복사 테스트', () {
      final deepCopyBook1 = book1.copyWith();
      final deepCopyBook2 = book2.copyWith();
      final deepCopyBook3 = book3.copyWith();

      expect(deepCopyBook1 == book1, equals(true));
      expect(deepCopyBook1.hashCode == book1.hashCode, equals(true));
      expect(identical(deepCopyBook1, book1), equals(false));

      expect(deepCopyBook2 == book2, equals(true));
      expect(deepCopyBook2.hashCode == book2.hashCode, equals(true));
      expect(identical(deepCopyBook2, book2), equals(false));

      expect(deepCopyBook3 == book3, equals(true));
      expect(deepCopyBook3.hashCode == book3.hashCode, equals(true));
      expect(identical(deepCopyBook3, book3), equals(false));
    });
  });
}
