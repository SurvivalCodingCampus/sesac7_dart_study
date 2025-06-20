import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/lecture_code/Instance/book.dart';
import 'package:test/test.dart';

void main() {
  group('인스턴스 기본조작 1번 테스트', () {
    DateTime datetime1 = DateTime.utc(2024, 1, 1);
    DateTime datetime2 = DateTime.utc(2025, 6, 19);
    final bookName1 = '만화';
    final bookName2 = '교과서';
    final comment1 = '재미있음';

    test('제목과 출간일 동일, 비동일 Test', () {
      //given(준비)
      Book book1 = Book(title: bookName1, comment: comment1, publishDate: datetime1,);
      Book book2 = Book(title: bookName1, comment: comment1, publishDate: datetime1,);
      Book book3 = Book(title: bookName2, comment: comment1, publishDate: datetime2,);

      //when(실행)

      //then(검증)
      expect(book1 == book2, true); // 모두 동일한 경우
      expect(book1 == book3, false); // 제목 날짜 상이한 경우
    });
  });

  group('인스턴스 기본조작 2번 테스트', () {
    DateTime datetime1 = DateTime.utc(2024, 1, 10);
    DateTime datetime2 = DateTime.utc(2025, 2, 5);
    DateTime datetime3 = DateTime.utc(2025, 3, 1);
    final bookName1 = '만화';
    final comment1 = '교과서';
    test('sort를 통한 순서 정렬 확인 Test', () {
      //given(준비)
      Book book1 = Book(title: bookName1, comment: comment1, publishDate: datetime1,);
      Book book2 = Book(title: bookName1, comment: comment1, publishDate: datetime2,);
      Book book3 = Book(title: bookName1, comment: comment1, publishDate: datetime3,);
      List<Book> bookList = [book1, book3, book2];
      List<Book> answerBookList = [book1, book3, book2];

      //when(실행)
      List<Book> sortedBook = bookList.sorted((a, b) => a.compareTo(b));

      //then(검증)
      // isBefore
      expect(sortedBook[0].publishDate.isBefore(sortedBook[1].publishDate), true);
      expect(sortedBook[1].publishDate.isBefore(sortedBook[2].publishDate), true);
      expect(sortedBook[0].publishDate.isBefore(sortedBook[2].publishDate), true);
      expect(bookList.equals(answerBookList) , true);
/*
      bool equals(List<E> other, [Equality<E> equality = const DefaultEquality()]) {
        if (length != other.length) return false;
        for (var i = 0; i < length; i++) {
          if (!equality.equals(this[i], other[i])) return false;
        }
        return true;
      }
*/

      // expect(sortedBook[0].publishDate.isBefore(sortedBook[0].publishDate) , false);

      // compareTo
      expect(sortedBook[0].publishDate.compareTo(sortedBook[2].publishDate), -1);
      expect(sortedBook[2].publishDate.compareTo(sortedBook[0].publishDate), 1);
    });
  });

  group('인스턴스 기본조작 3번 테스트', () {
    test('copyWith메서드 통한 깊은복사로 다른객체가 되었는지 확인 Test', () {
      //given(준비)
      Book book1 = Book(title: 'title', comment: 'comment');

      //when(실행)
      Book book2 = book1.copyWith();

      //then(검증)
      expect(book1 == book2, true); // 값이 같은지 확인
      expect(identical(book1, book2), false); // 메모리상 같은 객체를 가르키는지
    });
  });
}
