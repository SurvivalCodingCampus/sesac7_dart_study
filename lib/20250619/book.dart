

class Book implements Comparable<Book>{
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  int compareTo(Book other) {
    return -publishDate.compareTo(other.publishDate);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  Book deepCopy() => Book(title: title, comment: comment);

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment}) {
      return Book(
        title: title ?? this.title,
        publishDate: publishDate ?? this.publishDate,
        comment: comment ?? this.comment
      );
  }
}