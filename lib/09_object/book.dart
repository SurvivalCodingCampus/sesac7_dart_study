class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate.year == other.publishDate.year &&
          publishDate.month == other.publishDate.month &&
          publishDate.day == other.publishDate.day;

  @override
  int get hashCode {
    return title.hashCode ^
        publishDate.year.hashCode ^
        publishDate.month.hashCode ^
        publishDate.day.hashCode;
  }

  @override
  String toString() {
    return 'title: $title, publishedDate: ${publishDate.toString().split(' ')[0]}, comment: $comment\n';
  }

  @override
  int compareTo(other) {
    final int date = int.parse(
      publishDate.toString().split(' ')[0].replaceAll('-', ''),
    );
    final int otherDate = int.parse(
      other.publishDate.toString().split(' ')[0].replaceAll('-', ''),
    );

    return -(date - otherDate);
  }

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }
}
