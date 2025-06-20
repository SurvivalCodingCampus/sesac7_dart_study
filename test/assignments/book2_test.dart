import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/assignments/book2.dart';
import 'package:test/test.dart';

void main() {
  const String defaultTitle = 'Title';
  const String defaultComment = 'Comment';
  const String anotherTitle = 'Another Title';
  const String anotherComment = 'Another Comment';

  final DateTime defaultPublishDate = DateTime(2025);
  final DateTime anotherPublishDate = DateTime(2020);

  group('constructor', () {
    test(
      'When create Book2, the title, comment, and publishDate are the given values.',
      () {
        // given
        // when
        final book = Book2(
          title: defaultTitle,
          comment: defaultComment,
          publishDate: defaultPublishDate,
        );

        // then
        expect(book.title, defaultTitle);
        expect(book.comment, defaultComment);
        expect(book.publishDate, defaultPublishDate);
      },
    );

    test(
      'If create Book2 except for the publishDate, the title, comment are the given values and the publishDate is today.',
      () {
        // given
        final today = DateTime.now();

        // when
        final book = Book2(
          title: defaultTitle,
          comment: defaultComment,
        );

        // then
        expect(book.title, defaultTitle);
        expect(book.comment, defaultComment);
        expect(book.publishDate.year, today.year);
        expect(book.publishDate.month, today.month);
        expect(book.publishDate.day, today.day);
      },
    );
  });

  group('copyWith', () {
    test(
      'copyWith will create another instance.',
      () {
        // given
        final book = Book2(
          title: defaultTitle,
          comment: defaultComment,
          publishDate: defaultPublishDate,
        );

        // when
        final copied = book.copyWith();
        final book2Identical = identical(book, copied);
        final publishDateIdentical = identical(
          book.publishDate,
          copied.publishDate,
        );

        // then
        expect(copied.title, defaultTitle);
        expect(copied.comment, defaultComment);
        expect(copied.publishDate, defaultPublishDate);
        expect(book2Identical, isFalse);
        expect(publishDateIdentical, isFalse);
      },
    );

    test(
      'If copyWith title to another value, only title is different.',
      () {
        // given
        final book = Book2(
          title: defaultTitle,
          comment: defaultComment,
          publishDate: defaultPublishDate,
        );

        // when
        final copied = book.copyWith(title: anotherTitle);

        // then
        expect(copied.title, anotherTitle);
        expect(copied.comment, defaultComment);
        expect(copied.publishDate, defaultPublishDate);
      },
    );

    test(
      'If copyWith comment to another value, only comment is different.',
      () {
        // given
        final book = Book2(
          title: defaultTitle,
          comment: defaultComment,
          publishDate: defaultPublishDate,
        );

        // when
        final copied = book.copyWith(comment: anotherComment);

        // then
        expect(copied.title, defaultTitle);
        expect(copied.comment, anotherComment);
        expect(copied.publishDate, defaultPublishDate);
      },
    );

    test(
      'If copyWith publishDate to another value, it is different object.',
      () {
        // given
        final book = Book2(
          title: defaultTitle,
          comment: defaultComment,
          publishDate: defaultPublishDate,
        );

        // when
        final copied = book.copyWith(publishDate: anotherPublishDate);

        // then
        expect(copied.title, defaultTitle);
        expect(copied.comment, defaultComment);
        expect(copied.publishDate, anotherPublishDate);
      },
    );
  });

  group('equals', () {
    test(
      'If they have the same title and publishDate, they are the same object.',
      () {
        // given
        final book1 = Book2(
          title: defaultTitle,
          comment: defaultComment,
          publishDate: defaultPublishDate,
        );
        final book2 = book1.copyWith(
          comment: anotherComment,
        );

        // when
        final isSameObject = book1 == book2;
        final isSameHashCode = book1.hashCode == book2.hashCode;

        // then
        expect(isSameObject, isTrue);
        expect(isSameHashCode, isTrue);
      },
    );

    test(
      'If the publishDate is different, they are different objects.',
      () {
        // given
        final book1 = Book2(
          title: defaultTitle,
          comment: defaultComment,
          publishDate: defaultPublishDate,
        );
        final book2 = book1.copyWith(publishDate: anotherPublishDate);

        // when
        final isDifferentObject = book1 != book2;
        final isDifferentHashCode = book1.hashCode != book2.hashCode;

        // then
        expect(isDifferentObject, isTrue);
        expect(isDifferentHashCode, isTrue);
      },
    );
  });

  group('compareTo', () {
    test('Sort them in order of newest to oldest publication date.', () {
      // given
      final earliestYear = DateTime(2000);
      final middleYear = DateTime(2010);
      final book = Book2(
        title: defaultTitle,
        comment: defaultComment,
        publishDate: defaultPublishDate,
      );
      final books = [
        book.copyWith(publishDate: earliestYear),
        book.copyWith(publishDate: middleYear),
        book,
      ];

      // when
      final sortedBooks = books.sorted((a, b) => a.compareTo(b));

      // then
      expect(sortedBooks.first.publishDate, defaultPublishDate);
      expect(sortedBooks.last.publishDate, earliestYear);
    });
  });
}
