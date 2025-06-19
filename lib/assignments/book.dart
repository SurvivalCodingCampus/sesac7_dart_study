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

  int compareTo(Book other) {
    return other.publishDate.compareTo(publishDate);
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
}
