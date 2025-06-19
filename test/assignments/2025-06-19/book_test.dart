import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/assignments/2025-06-19/book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Book 테스트', () {
    final bookTitle = '생존코딩';
    final bookComment = '플러터 생존코딩';
    final bookPublishDate = DateTime(2025, 06, 19);

    final book2Comment = '안드로이드 생존코딩';

    test('Book 생성자 테스트', () {
      Book book = Book(
        title: bookTitle,
        comment: bookComment,
        publishDate: bookPublishDate,
      );
      expect(book.title, '생존코딩');
      expect(book.comment == '플러터 생존코딩', true);
      expect(book.publishDate, bookPublishDate);
    });

    test('Book 제목과 출간일이 같으면 동등하다고 판단하는가? (연습문제1번)', () {
      Book book1 = Book(
        title: bookTitle,
        comment: bookComment,
        publishDate: bookPublishDate,
      );
      Book book2 = Book(
        title: bookTitle,
        comment: book2Comment,
        publishDate: bookPublishDate,
      );

      expect(book1.compareTo(book2) == 0, true);
    });

    test('Book 인스턴스를 담고 있는 컬렉션에 sort 수행하여 출간일이 신상순으로 정렬(연습문제2번)', () {
      ///Book 객체 4개를 만들고, 순서를 섞어 리스트에 넣은 후 , Book 클래스에 정의 해 둔 compareTo()를
      Book book1 = Book(
        title: bookTitle,
        comment: bookComment,
        publishDate: DateTime(2000, 11, 12),
      );
      Book book2 = Book(
        title: bookTitle,
        comment: book2Comment,
        publishDate: DateTime(2013, 03, 01),
      );
      Book book3 = Book(
        title: bookTitle,
        comment: bookComment,
        publishDate: DateTime(2025, 06, 19),
      );
      Book book4 = Book(
        title: bookTitle,
        comment: book2Comment,
        publishDate: DateTime(2004, 11, 13),
      );
      List<Book> list = [book2, book4, book3, book1];
      final sortedList = list.sorted();
      final expectedList = [book3, book2, book4, book1];
      expect(sortedList, equals(expectedList));
    });

    test('Book 클래스 copyWith 테스트', () {
      ///원본은 book1. book2는 그대로 복사. book3는 title만 복사하고 수정. book4는 복사하고 title,comment 수정. book5는 복사하고 모든 프로퍼티 수정.
      Book book1 = Book(
        title: bookTitle,
        comment: bookComment,
        publishDate: bookPublishDate,
      );
      Book book2 = book1.copyWith();

      expect(book1, equals(book2));
      expect(book1 == book2, true);
      expect(identical(book1, book2), false);
      expect(identical(book2.publishDate, bookPublishDate), false);

      // Book book3 = book1.copyWith(title: '생코딩');
      // Book book4 = book1.copyWith(title: '생코', comment: '플러');
      // Book book5 = book1.copyWith(
      //   title: '생',
      //   comment: '플',
      //   publishDate: DateTime(2000, 11, 12),
      // );


      // expect(book1, isNot(book3));
      // expect(
      //   book1.comment.hashCode,
      //   book3.comment.hashCode,
      // ); //book3는 book1의 title만 바꾸고, comment는 그대로 복사했기 때문에, 해시 값이 같은지 테스트.
      // expect(book1, isNot(book4));
      // expect(book4.title, '생코');
      // expect(book1.publishDate.hashCode, book4.publishDate.hashCode);
      //
      //
      // expect(book1, isNot(book5));
      // expect(book5.publishDate, DateTime(2000, 11, 12));
      // expect(book1.publishDate.hashCode, isNot(book5.publishDate.hashCode));
    });
  });
}
