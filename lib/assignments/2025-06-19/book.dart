import 'package:collection/collection.dart';

class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  // @override
  // bool operator ==(Object other) {
  //   if (other is Book) {
  //     return title == other.title && publishDate == other.publishDate;
  //   }
  //   return false;
  // }

  @override
  int compareTo(Book other) {
    // TODO: implement compareTo
    return other.publishDate.compareTo(publishDate);
  }

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }

  // Book copyWith({String? title, String? comment, DateTime? publishDate}) {
  //   return Book(
  //     title: title ?? this.title,
  //     comment: comment ?? this.comment,
  //     publishDate: publishDate ?? this.publishDate,
  //   );
  // }
  Book copyWith() =>
      Book(title: title, comment: comment, publishDate: publishDate.copyWith());
}

void main() {
  Book book1 = Book(
    title: 'a',
    comment: 'aa',
    publishDate: DateTime(2025, 10, 01),
  );
  Book book2 = Book(
    title: 'b',
    comment: 'bb',
    publishDate: DateTime(2024, 10, 01),
  );
  Book book3 = Book(
    title: 'c',
    comment: 'cc',
    publishDate: DateTime(2023, 10, 01),
  );

  List<Book> list = [book2, book3, book1];
  print(list);
  final sortedList = list.sorted();
  print(sortedList);

  Book book4 = book3.copyWith();
  print('book4 : $book4');
  // Book book5 = book3.copyWith(
  //   title: 'e',
  //   comment: 'ee',
  //   publishDate: DateTime(2019, 10, 01),
  // );
  Book book5 = book3.copyWith();
  print('book5 : $book5');
}
