class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) {
    return other is Book &&
        title == other.title &&
        publishDate == other.publishDate;
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  int compareTo(Book other) {
    return other.publishDate.compareTo(publishDate);
  }

  Book copyWith({String? title, String? comment, DateTime? publishDate}) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }
}

void main() {
  final book1 = Book(
    title: 'Dart',
    comment: '언어',
    publishDate: DateTime(2023, 1, 1),
  );

  final book2 = Book(
    title: 'Flutter',
    comment: '프레임워크',
    publishDate: DateTime(2024, 1, 1),
  );

  final book3 = Book(
    title: 'RiverPod',
    comment: '라이브러리',
    publishDate: DateTime(2025, 1, 1),
  );

  List<Book> books = [book1, book2, book3];

  books.sort();

  for (var book in books) {
    print('책 제목 : ${book.title}, 날짜 : ${book.publishDate}');
  }

  final book = Book(
    title: '플러터',
    comment: '플러터 책',
    publishDate: DateTime(2024, 1, 1),
  );

  final copyBook = book.copyWith(comment: '플러터 책 설명 변경');

  print(copyBook.title);
  print(copyBook.comment);
  print(copyBook.publishDate);
}
