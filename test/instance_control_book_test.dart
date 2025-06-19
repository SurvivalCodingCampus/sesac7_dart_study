import 'dart:math';

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/instance_control_practice/instance_control_book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('InstanceControlBookTest', () {
    group('InstanceControlBook 클래스 생성자 테스트', () {
      test('기본 생성자 테스트', () {
        final String testBookTitle = 'TestBookTitle';
        final String testBookComment = 'TestBookComment';
        final DateTime testBookPublishDate = DateTime(2025, 06, 19);
        final InstanceControlBook testBook = InstanceControlBook(title: testBookTitle, comment: testBookComment, publishDate: testBookPublishDate);

        expect(testBook.title, equals(testBookTitle));
        expect(testBook.comment, equals(testBookComment));
        expect(testBook.publishDate, equals(testBookPublishDate));
      });

      test('복사한 Book과 기존 Book 생성자 인자값 동일 테스트', () {
        final InstanceControlBook originalBook = InstanceControlBook(title: 'TestBookTitle', comment: 'TestBookComment', publishDate: DateTime(2025, 06, 19));
        final InstanceControlBook copyBook = originalBook.copyWith();

        expect(originalBook.title, equals(copyBook.title));
        expect(originalBook.comment, equals(copyBook.comment));
        expect(originalBook.publishDate.isAtSameMomentAs(copyBook.publishDate), isTrue);
      });
    });

    group('InstanceControlBook 동등성 비교 테스트', () {
      group('InstanceControlBook operator(==) 동등성 비교 테스트', () {
        test('InstanceControlBook title, publishDate 값이 동일 한 경우 동등성 비교', () {
          final String bookTitle = 'TestBookTitle';
          final DateTime bookPublishDate = DateTime(2025, 06, 19);
          final InstanceControlBook book1 = InstanceControlBook(title: bookTitle, comment: 'TestBook1Comment', publishDate: bookPublishDate);
          final InstanceControlBook book2 = InstanceControlBook(title: bookTitle, comment: 'TestBook2Comment', publishDate: bookPublishDate);

          expect(book1 == book2, isTrue);
        });

        test('InstanceControlBook 생성한 기존 인스터스와 복사한 인스턴스의 operator(==) 동등성 비교 테스트', () {
          final InstanceControlBook originalBook = InstanceControlBook(title: 'TestBookTitle', comment: 'TestBookComment', publishDate: DateTime(2025, 06, 19));
          final InstanceControlBook copyBook = originalBook.copyWith();

          expect(originalBook == copyBook, isTrue);
        });
      });

      group('InstanceControlBook Collection 동등성 테스트', () {
        test('InstanceControlBook List 동등성 테스트', () {
          final String bookTitle = 'TestBookTitle';
          final DateTime bookPublishDate = DateTime(2025, 06, 19);
          final InstanceControlBook book1 = InstanceControlBook(title: bookTitle, comment: 'TestBook1Comment', publishDate: bookPublishDate);
          final InstanceControlBook book2 = InstanceControlBook(title: bookTitle, comment: 'TestBook2Comment', publishDate: bookPublishDate);
          final List<InstanceControlBook> books = [];

          books.add(book1);
          books.remove(book2);

          expect(books.isEmpty, isTrue);
        });

        test('InstanceControlBook Set 동등성 테스트', () {
          final String bookTitle = 'TestBookTitle';
          final DateTime bookPublishDate = DateTime(2025, 06, 19);
          final InstanceControlBook book1 = InstanceControlBook(title: bookTitle, comment: 'TestBook1Comment', publishDate: bookPublishDate);
          final InstanceControlBook book2 = InstanceControlBook(title: bookTitle, comment: 'TestBook2Comment', publishDate: bookPublishDate);
          final Set<InstanceControlBook> books = {};

          books.add(book1);
          books.remove(book2);

          expect(books.isEmpty, isTrue);
        });

        test('InstanceControlBook Map 동등성 테스트', () {
          final String bookTitle = 'TestBookTitle';
          final DateTime bookPublishDate = DateTime(2025, 06, 19);
          final InstanceControlBook book1 = InstanceControlBook(title: bookTitle, comment: 'TestBook1Comment', publishDate: bookPublishDate);
          final InstanceControlBook book2 = InstanceControlBook(title: bookTitle, comment: 'TestBook2Comment', publishDate: bookPublishDate);
          final Map<String, InstanceControlBook> books = {};

          books['book1'] = book1;

          expect(books.containsValue(book2), isTrue); // Map의 Value에 추가하지 않은 book2를 찾아서 있으면 동등성 비교 테스트 성공
        });
      });

      test('InstanceControlBook 생성한 기존 인스턴스와 복사한 인스턴스 identical Test', () {
        final InstanceControlBook originalBook = InstanceControlBook(title: 'TestBookTitle', comment: 'TestBookComment', publishDate: DateTime(2025, 06, 19));
        final InstanceControlBook copyBook = originalBook;

        expect(identical(originalBook, copyBook), isTrue);
      });
    });

    group('InstanceControlBook sort 테스트', () {
      test('InstanceControlBook publishDate 신상 기준 정렬 테스트', () {
        List<InstanceControlBook> books = getBookList(10);
        List<InstanceControlBook> sortedBooks = books.sorted();

        for(int i = 0; i < sortedBooks.length - 1; i++) {
          expect(sortedBooks[i].publishDate.isAfter(sortedBooks[i + 1].publishDate), isTrue);
        }
      });
    });
  });
}

List<InstanceControlBook> getBookList(int bookCount) {
  final List<InstanceControlBook> result = [];
  final random = Random();

  for(int i = 0; i < bookCount; i++) {
    final int dateYear = random.nextInt(2026);
    final int dateMonth = random.nextInt(13);
    final int dateDay = random.nextInt(getMaxDay(dateYear, dateMonth) + 1);
    final InstanceControlBook book = InstanceControlBook(title: 'TestBook${i}Title', comment: 'TestBook${i}Comment', publishDate: DateTime(dateYear, dateMonth, dateDay));
    result.add(book);
  }

  return result;
}

/*
* 해당 년도의 달에 올 수 있는 최대 날짜를 구하는 유틸
*/
int getMaxDay(int year, int month) {
  int result;
  if(month == 2) {
    if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
      result = 29;
    } else {
      result = 28;
    }
  } else if(month == 4 || month == 6 || month == 9 || month == 11) {
    result = 30;
  } else {
    result = 31;
  }
  return result;
}