class Book {
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
  int get hashCode => title.hashCode ^ publishDate.hashCode;
}
