import 'package:modu_3_dart_study/assignments/book.dart';
import 'package:test/test.dart';

void main() {
  group('Book 테스트', () {
    test('book이 서로 같은지 비교', () {
      final a = Book(
        title: '제목',
        comment: '1',
        publishDate: DateTime(2024, 1, 1),
      );
      final b = Book(
        title: '제목',
        comment: '2',
        publishDate: DateTime(2024, 1, 1),
      );

      expect(a == b, isTrue);
    });

    test('정렬 비교 테스트', () {
      final a = Book(
        title: 'book1',
        comment: '4',
        publishDate: DateTime(2023, 1, 1),
      );
      final b = Book(
        title: 'book2',
        comment: '5',
        publishDate: DateTime(2025, 1, 1),
      );
      final c = Book(
        title: 'book3',
        comment: '6',
        publishDate: DateTime(2024, 1, 1),
      );

      final list = [a, b, c];
      list.sort();

      expect(list[0], equals(b));
      expect(list[1], equals(c));
      expect(list[2], equals(a));
    });

    test('copyWith로 데이터 변경 테스트 ', () {
      final book4 = Book(
        title: 'book 제목',
        comment: 'book 내용',
        publishDate: DateTime(2025, 1, 1),
      );

      final updated = book4.copyWith(comment: 'book 내용 변경');

      expect(updated.title, equals('book 제목'));
      expect(updated.comment, equals('book 내용 변경'));
      expect(updated.publishDate, equals(DateTime(2025, 1, 1)));
    });
  });
}
