

class Book implements Comparable<Book>{
  final String title;
  final DateTime publishDate;
  final String comment;

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
          publishDate.year == other.publishDate.year &&
          publishDate.month == other.publishDate.month &&
          publishDate.day == other.publishDate.day;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  Book deepCopy() {
    DateTime dateTime = DateTime(publishDate.year, publishDate.month, publishDate.day);
    return Book(title: title, comment: comment, publishDate: dateTime);
  }

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