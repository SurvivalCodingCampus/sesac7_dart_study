class InstanceControlBook implements Comparable<InstanceControlBook> {
  String title;
  DateTime publishDate;
  String comment;

  InstanceControlBook({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) {
    return other is InstanceControlBook
        ? title == other.title &&
              publishDate.isAtSameMomentAs(other.publishDate)
        : false;
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  int compareTo(InstanceControlBook other) =>
      other.publishDate.compareTo(publishDate);

  InstanceControlBook copyWith() => InstanceControlBook(
    title: title,
    comment: comment,
    publishDate: publishDate.copyWith(),
  );

  // fixme:: Debug
  @override
  String toString() {
    return 'InstanceControlBook(title: $title, comment: $comment, publishDate: $publishDate)';
  }
}
