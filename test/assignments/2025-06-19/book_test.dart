import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-19/book.dart';
import 'dart:collection';

void main() {
  group('GROUP : Book eqaulity override test\n', () {
    test('Same title, same publishDate', () {
      //given
      DateTime date1 = DateTime(1995, 11, 9);
      DateTime date2 = DateTime(1995, 11, 9);

      Book book1 = Book(
        title: "오준석의 생존코딩",
        publishDate: date1,
        comment: "생존코딩 책",
      );
      Book book2 = Book(
        title: "오준석의 생존코딩",
        publishDate: date2,
        comment: "생존코딩 책",
      );
      Book book3 = Book(
        title: "오준석의 생존코딩",
        publishDate: date1,
        comment: "생존코딩 책",
      );

      //when

      //then
      expect(date1 == date2, true);
      expect(book1 == book2, true);
      expect(book1 == book3, true);
    });
    test('Same title, different publishDate', () {
      //given
      DateTime date1 = DateTime(1995, 11, 9);
      DateTime date2 = DateTime(1973, 4, 27);

      Book book1 = Book(
        title: "오준석의 생존코딩",
        publishDate: date1,
        comment: "생존코딩 책",
      );
      Book book2 = Book(
        title: "오준석의 생존코딩",
        publishDate: date2,
        comment: "생존코딩 책",
      );
      //when

      //then
      expect(date1 == date2, false);
      expect(book1 == book2, false);
    });
    test('Different title, same publishDate', () {
      //given
      DateTime date1 = DateTime(1995, 11, 9);
      DateTime date2 = DateTime(1995, 11, 9);

      Book book1 = Book(
        title: "오준석의 생존코딩",
        publishDate: date1,
        comment: "생존코딩 책",
      );
      Book book2 = Book(
        title: "이준석의 생존코딩",
        publishDate: date2,
        comment: "생존코딩 책",
      );
      //when

      //then
      expect(date1 == date2, true);
      expect(book1 == book2, false);
    });
    test('Same title, publishdate, but different comment', () {
      //given
      DateTime date1 = DateTime(1995, 11, 9);
      DateTime date2 = DateTime(1995, 11, 9);

      Book book1 = Book(
        title: "오준석의 생존코딩",
        publishDate: date1,
        comment: "생존코딩 책",
      );
      Book book2 = Book(
        title: "오준석의 생존코딩",
        publishDate: date2,
        comment: "생존코딩 책일지도 몰라요",
      );
      //when

      //then
      expect(date1 == date2, true);
      expect(book1 == book2, true);
    });
  });
  group('GROUP : comparedTo testing\n', () {
    test('', () {
      //given
      Book yellowBook = Book(
        title: "노란책",
        publishDate: DateTime(1000, 1, 1),
        comment: "노랗다",
      );
      Book blueBook = Book(
        title: "파란책",
        publishDate: DateTime(700, 1, 1),
        comment: "시퍼렇다",
      );
      Book redBook = Book(
        title: "빨간책",
        publishDate: DateTime(1200, 1, 1),
        comment: "시뻘겋다",
      );

      List<Book> books = [yellowBook, blueBook, redBook];
      books.sort();
      //when

      //then
      expect(
        ListEquality().equals(books, [blueBook, yellowBook, redBook]),
        true,
      );
    });
  });
}
