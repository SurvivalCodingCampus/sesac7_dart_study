class Book2 implements Comparable {
  final String title;
  final String comment;
  final DateTime publishDate;

  Book2({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  Book2 copyWith({
    String? title,
    String? comment,
    DateTime? publishDate,
  }) {
    return Book2(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate.copyWith(),
    );
  }

  @override
  int get hashCode =>
      '$title${publishDate.year}${publishDate.month}${publishDate.day}'
          .hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Book2 &&
            title == other.title &&
            publishDate.year == other.publishDate.year &&
            publishDate.month == other.publishDate.month &&
            publishDate.day == other.publishDate.day;
  }

  @override
  int compareTo(other) {
    if (other is! Book2) {
      throw Exception('Book2와 Book2를 비교해야 합니다.');
    }

    return -publishDate.compareTo(other.publishDate);
  }
}
