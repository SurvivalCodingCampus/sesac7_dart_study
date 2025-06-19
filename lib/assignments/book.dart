class Book {
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
}
