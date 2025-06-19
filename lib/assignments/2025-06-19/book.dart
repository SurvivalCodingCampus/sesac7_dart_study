class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) {
    // same title && same publishDate => same book!
    return identical(this, other) ||
        other is Book &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            publishDate == other.publishDate;
  }

  @override
  String toString() {
    return '$title published at ${publishDate.year}-${publishDate.month}-${publishDate.day}';
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  }

  Book copyWith() =>
      Book(title: title, comment: comment, publishDate: publishDate.copyWith());
}
